
NetAddr.langPort;    // retrieve the current port SC is listening to

NetAddr.localAddr    // retrieve the current IP and port

p = thisProcess.openUDPPort(60001); // attempt to open 1121
q = thisProcess.openUDPPort(60002);
r = thisProcess.openUDPPort(60003);

thisProcess.openPorts; // list all open ports


b = Buffer.read(s, "snare.wav".resolveRelative);
b.play;

c = Buffer.read(s, "bass4.wav".resolveRelative);
c.play;

d = Buffer.read(s, "scribble.wav".resolveRelative);
d.play;

(
d.action = {|... msg|

	msg[0].postln;
	if (msg[0] == '1' ) { ("HELLOOOOOOOOOO").postln }

	//if ((msg[0] > 0) && (msg[3] == 60002)) { b.play };

	//if ((msg[3] == 60002) && (msg[0] == "[ 1 ]")) { b.play }
};

);

(
f = { |msg, time, replyAddr, recvPort|
    if(msg[0] != '/status.reply') {
        "At time %s received message % from % on port%\n".postf( time, msg, replyAddr, recvPort )
    };

	if (msg[0] != '0' && recvPort == 60001 ) { c.play };
	if (msg[0] == '1' && recvPort == 60002 ) { b.play };
	if (msg[0] != '0' && recvPort == 60003 ) { d.play }
};
thisProcess.addOSCRecvFunc(f);
);
//make a handful of differet package sockets then say when the socket parameter == x and the msg parameter is what we are looking for excecute some function