//Curso de SuperCollider CMM 2022//
//Clase 1//

//para todos los ejercicios procura trabajar con una copia del codigo.
//Para cualquier consulta, guarda el documento con tu nombre al principio y subelo a la carpeta de drive https://drive.google.com/drive/folders/1hFPN37e0j-3_Ow2MZh4QMg0FiJ3JlDxU?usp=sharing.
//escribe como comentario cualquier duda, comentario y/o observacion que tengas.

/*1*/
//del siguiente bloque de codigo ve de que manera podemos monitorear cada paso  de la operacion utilizando el metodo .postln

"Hello world".postln;//<-- es como un console.log() de Js.

(
var num;
num = 10; //
num = num / 2;
num = num.pow(2); //.pow() eleva a la pontencia de un numero
num = num.neg; //.neg invierte el signo
num = num / (1/3); //es posible escribir numeros como fracciones
num = num.abs; //.abs nos otorga el valor absoluto
num = num / 10;
num = num.round.postln; //round redondea
)

//recuerda que para evaluar una "linea" de codigo utilizamos el comando [shift + enter]
//para evaluar un "bloque" de codigo utilizamos el comando [ctrl ó cmd + enter]


/*2*/
//Realiza los cambios necesarios en la funcion para que esta sea capaz, al momento de su ejecución, de recibir diferentes valores.
(
~funcwArgs =({
	arg sig;
	sig = [sig, sig.neg];
	sig = 1.5 * sig; //es posible realizar operaciones entre numeros y arreglos.
	sig = [0.1, 100] * sig; //es posible realizar operaciones entre arreglos de diferentes tamaños
	sig = (1..5) * sig; //(1..5) es otra forma de escribir el arreglo [1,2,3,4,5]
 });
~funcwArgs.value(100);
)
//recuerda que se consideran dos procesos direfentes el definir una función y el ejecutarla.
//recuerda que una variable es considerado un contenedor pero no es capaz de cambiar su contenido desde fuera de la funcion.

/*3*/
// Revisa la documentaicon de "Array" y encuentra tres maneras de modificar el siguiente arreglo;
//Guarda los resultados en tres diferentes variables globales(~).

(
var array;
array = [];
array = array.add(2); //Es posible añadir nuevos elementos a un arreglo utilizando el metodo .add;
array = array.add(4);
array = array.add(6);
//otra forma de definir arreglos es utilizar el objeto "Array"
//array = Array.fill(3,{arg i; (i*2)+2});
//array = Array.series(3, 2, 2);
~fillingArray1 = array;
)
~fillingArray2 = Array.rand(5, 1, 50);
~fillingArray3 = Array.series(7,3,2);


/*4*/
//Almacena en diferentes funciones los siguientes objetos: SinOsc, Pulse y Saw.
//Almacena la ejecuccion de cada funcion en variables independientes de tal manera que sea posible ejecutar los metodos .play y .free.

~osc = {SinOsc.ar(300)*0.1};
~playOsc =	~osc.play;
~playOsc.free;

~pulse = {Pulse.ar(500)*0.1};
~playPulse = ~pulse.play;
~playPulse.free;

~saw = {Saw.ar(220)*0.1};
~playSaw = ~saw.play;
~playSaw.free;


// ANTES DE EVALUAR UNA FUNCION QUE GENERE SONIDO ASEGURATE DE BAJAR EL VOLUMEN DE TU COMPUTADORA PARA PREVENIR CUALQUIER RESULTADO INESPERADO.

// ES RECOMENDABLE MULTIPLICAR EL GENERADOR POR UN NUMERO MENOR A 1 ejemplo: SinOsc.ar(220) * 0.1

// RECUERDA QUE PARA DETENER CUALQUIER PROCESO DE AUDIO EN SC UTILIZAMOS EL COMANDO [ctrl ó cmd + . ]


/*5*/
//Crea 3 diferentes SynthDef utilizando los generadores anteriores, hazlo de tal forma que te permita modificar el valor de la frequencia despues de ser ejecutado con el metodo .set

/*

recuerda la estructura del SynthDef:

(
SynthDef(\nombre, { //nombre con el cual se identifica el sintetizador
   arg //argumentos del sintetizador
   var //variables dentro del sintetizador.

   Out.ar(canal de salida, señal de salida)
}).add;
)

recuerda que para ejecutar un SynthDef utilizamos el objeto Synth.
*/

(
SynthDef(\osc, {
	arg out = 0, freq = 300;
	var sig;

	sig = SinOsc.ar(freq);
	sig = sig * 0.1;

	Out.ar(out,sig);
}).add;
)
o = Synth(\osc, [\freq, 300]);
o.set(\freq, 500);
o.free;

(
SynthDef(\pulse, {
   arg out = 0, freq = 500;
   var sig;

   sig = Pulse.ar(freq);
   sig = sig * 0.1;

   Out.ar(out, sig)
}).add;
)
p = Synth(\pulse,[\freq, 500]);
p.set(\freq, 440);
p.free;

(
SynthDef(\saw, {
   arg out = 0, freq = 500;
   var sig;

   sig = Saw.ar(freq);
   sig = sig * 0.1;

   Out.ar(out, sig)
}).add;
)
s = Synth(\saw,[\freq, 500]);
s.set(\freq, 200);
s.free;