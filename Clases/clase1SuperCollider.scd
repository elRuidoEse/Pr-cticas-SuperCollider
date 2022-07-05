(
~func = {
	var num;
	num =3;
	num = num + 4;
	num = num;
}.value
)

(
~funce = {
	arg num;
	var x;
	x =3;
	x = num/2;
	x;
}
);
~funce.value(100);

s.boot;

{SinOsc.ar(220)* 0.1}.play;

(SynthDef (\synth,{
	arg out = 0,freq =220;
	var sig;

	sig = SinOsc.ar(freq);
	sig = sig * 0.1;

	Out.ar(out,sig);
}).add;
);

x = Synth(\synth,[\freq,100])
x.set(\freq,300);
x.free;

y = Synth(\synth,[\freq,200])
y.set(\freq,300);
y.free;