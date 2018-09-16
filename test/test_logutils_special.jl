using Profile
#using Revise
#using Test
if !@isdefined LOGGINGPATH
    (@__DIR__) ∉ LOAD_PATH && push!(LOAD_PATH, @__DIR__)
    const LOGGINGPATH = realpath(joinpath(@__DIR__, "..", "logutils"))
    LOGGINGPATH ∉ LOAD_PATH && push!(LOAD_PATH, LOGGINGPATH)
end
using logutils_ws # Before Logging matters.
using Logging

x=5
@info "What's up", x, :red, 5-3

function test(x)
    for i = 1:1
        @warn "Be warned"
        @warn "x = $x"
        @warn "x = ", x

    end
end

logger = WebSocketLogger()
@warn "x = $logger"
@warn "x = x"

with_logger(logger) do
    test(1)
    test([1,2])
end

@profile with_logger(logger) do
    test(1)
    test([1,2])
end

Profile.print(stdout)
Profile.clear()
end
