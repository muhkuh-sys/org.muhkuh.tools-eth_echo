require 'muhkuh_cli_init'

local lluv = require 'lluv'


local function onSent(a, b, c, d, e, f)
--  print(a, b, c, d, e, f)
end


local function on_receive(tSocket, err, strData, flags, host, port)
  if err then
    return
  end

--  print(tSocket, err, string.len(strData), flags, host, port)

  tSocket:send(host, port, strData, onSent)
end


local tUdpSocket = lluv.udp()
print('UDP socket:', tUdpSocket)
tUdpSocket:bind("*", 5555)
tUdpSocket:start_recv(on_receive)

lluv.run()
