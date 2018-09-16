#=
Included in logutils.jl
=#

import WebSockets.WebSocket # todo remove when including in WebSockets itself.
show(io::IO, ws::WebSocket) = directto_abstractdevice(io, ws)
function _show(d::Ref{AbstractDevice}, ws::WebSocket{T}) where T
    _log(d, "WebSocket{", T, "}(")
    _log(d, ws.server ? "server, " : "client, ")
    _log(d, ws.socket, " ")
    show(IOContext(d.s, :compact => true), ws.state)
    _log(d, ")")
    nothing
end

nothing
