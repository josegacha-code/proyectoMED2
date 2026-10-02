package {

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import flash.events.TransformGestureEvent;
	import flash.events.GestureEvent;
	import flash.events.MouseEvent;
	import flash.geom.Transform;
	import flash.ui.Mouse;
	import flash.media.Sound;
	import flash.net.URLRequest;


	public class codeRender extends MovieClip {
		var Aux_pantalla: Number = 0; //Variable de posición de pantalla

		public function codeRender() {
			stop();
			btn_inicio.addEventListener(MouseEvent.CLICK, iniciarContenido);
		}
		public function iniciarContenido(e: MouseEvent) {
			gotoAndStop(5);
			Aux_pantalla = 1;
			mostrarContenido();
			Multitouch.inputMode = MultitouchInputMode.GESTURE;
			stage.addEventListener(TransformGestureEvent.GESTURE_SWIPE, deslizarContenido);
		}
		public function deslizarContenido(e: TransformGestureEvent) {
			mostrarContenido();
			if (e.offsetX == 1 && Aux_pantalla > 1) {
				prevFrame();
				Aux_pantalla--;
			}
			if (e.offsetX == -1 && Aux_pantalla < 4) {
				nextFrame();
				Aux_pantalla++;
			}
		}
		public function mostrarContenido() {
			switch (Aux_pantalla) {
				case 1:
					actividad1();
					break;
			}
		}
		//**************************************************************************************
		//INICIO BLOQUE ACTIVIDAD 1 DE DRAG AND DROP
		//**************************************************************************************
		public static var sonidoTest: Sound = new Sound(new URLRequest("insumos_proyecto/success1.mp3"));

		public var cont1: Number = 0;
		public var trust1: Number = 0;
		public function actividad1() {
			//Reinicio de actividades
			clip_escenario1.visible = false;
			clip_escenario2.visible = false;
			clip_escenario3.visible = false;
			clip_escenario4.visible = false;

			//Reinicio botones
			btn_check_trojan.visible = false;
			btn_check_hack.visible = false;
			btn_check_botnet.visible = false;
			btn_check_virus.visible = false;

			btn_error_botnet.visible = false;
			btn_error_hack.visible = false;
			btn_error_virus.visible = false;
			btn_error_trojan.visible = false;

			btn_verify.visible = false;
			btn_retry.visible = false;

			//posicionar elementos
			btn_check_trojan.x = 668;
			btn_check_trojan.y = 99;

			btn_check_hack.x = 32;
			btn_check_hack.y = 237;

			btn_check_botnet.x = 32;
			btn_check_botnet.y = 99;

			btn_check_virus.x = 668;
			btn_check_virus.y = 238;

			btn_error_botnet.x = 32;
			btn_error_botnet.y = 99;

			btn_error_hack.x = 32;
			btn_error_hack.y = 237;

			btn_error_virus.x = 668;
			btn_error_virus.y = 238;

			btn_error_trojan.x = 668;
			btn_error_trojan.y = 99;

			btn_verify.x = 334;
			btn_verify.y = 101;

			btn_retry.x = 334;
			btn_retry.y = 101;

			//EventListener Actividad Drag
			clip_hacker.addEventListener(MouseEvent.MOUSE_DOWN, Mover1);
			clip_botnet.addEventListener(MouseEvent.MOUSE_DOWN, Mover1);
			clip_trojan.addEventListener(MouseEvent.MOUSE_DOWN, Mover1);
			clip_virus.addEventListener(MouseEvent.MOUSE_DOWN, Mover1);

			//EventListener Actividad Drop
			clip_hacker.addEventListener(MouseEvent.MOUSE_UP, Soltar1);
			clip_botnet.addEventListener(MouseEvent.MOUSE_UP, Soltar1);
			clip_trojan.addEventListener(MouseEvent.MOUSE_UP, Soltar1);
			clip_virus.addEventListener(MouseEvent.MOUSE_UP, Soltar1);

			//EventListener Actividad Verificar
			btn_verify.addEventListener(MouseEvent.CLICK, Verificar1);

			//EventListener Actividad Reintentar
			btn_retry.addEventListener(MouseEvent.CLICK, Repetir1);

			//EventListener Actividad Animación
			btn_check_trojan.addEventListener(MouseEvent.CLICK, Animar1);
			btn_check_hack.addEventListener(MouseEvent.CLICK, Animar1);
			btn_check_botnet.addEventListener(MouseEvent.CLICK, Animar1);
			btn_check_virus.addEventListener(MouseEvent.CLICK, Animar1);
			clip_escenario1.btn_cerrar1.addEventListener(MouseEvent.CLICK, CerrarVentana1);
			clip_escenario2.btn_cerrar1.addEventListener(MouseEvent.CLICK, CerrarVentana1);
			clip_escenario3.btn_cerrar1.addEventListener(MouseEvent.CLICK, CerrarVentana1);
			clip_escenario4.btn_cerrar1.addEventListener(MouseEvent.CLICK, CerrarVentana1);
		}

		public function Mover1(e: MouseEvent) {
			e.target.startDrag();
		}
		public function Soltar1(e: MouseEvent) {
			e.target.stopDrag();
			if (e.target.hitTestObject(clip_destinobotnet)) {
				e.target.x = 32;
				e.target.y = 99;
				trust1++;
			}
			if (e.target.hitTestObject(clip_destinohacker)) {
				e.target.x = 32;
				e.target.y = 237;
				trust1++;
			}
			if (e.target.hitTestObject(clip_destinotrojan)) {
				e.target.x = 668;
				e.target.y = 99;
				trust1++;
			}
			if (e.target.hitTestObject(clip_destinovirus)) {
				e.target.x = 668;
				e.target.y = 238;
				trust1++;
			}

			if (trust1 == 4) {
				btn_verify.visible = true;
			}
		}
		public function Verificar1(e: MouseEvent) {
			clip_trojan.visible = false;
			clip_virus.visible = false;
			clip_hacker.visible = false;
			clip_botnet.visible = false;

			if (clip_trojan.hitTestObject(clip_destinotrojan)) {
				btn_check_trojan.visible = true;
				cont1++;
			} else {
				btn_error_trojan.visible = true;
			}
			if (clip_botnet.hitTestObject(clip_destinobotnet)) {
				btn_check_botnet.visible = true;
				cont1++;
			} else {
				btn_error_botnet.visible = true;
			}
			if (clip_hacker.hitTestObject(clip_destinohacker)) {
				btn_check_hack.visible = true;
				cont1++;
			} else {
				btn_error_hack.visible = true;
			}
			if (clip_virus.hitTestObject(clip_destinovirus)) {
				btn_check_virus.visible = true;
				cont1++;
			} else {
				btn_error_virus.visible = true;
			}

			if (cont1 == 0 || cont1 < 4) {
				btn_verify.visible = false;
				btn_retry.visible = true;
			} else if (cont1 == 4) {
				btn_verify.visible = false;
				btn_retry.visible = true;
				sonidoTest.play();
			}
		}
		public function Repetir1(e: MouseEvent) {
			trust1 = 0;
			cont1 = 0;

			clip_trojan.x = 241;
			clip_trojan.y = 27;

			clip_hacker.x = 488;
			clip_hacker.y = 27;

			clip_botnet.x = 488;
			clip_botnet.y = 230

			clip_virus.x = 241;
			clip_virus.y = 233;

			clip_escenario1.visible = false;
			clip_escenario2.visible = false;
			clip_escenario3.visible = false;
			clip_escenario4.visible = false;

			//Reinicio botones
			btn_check_trojan.visible = false;
			btn_check_hack.visible = false;
			btn_check_botnet.visible = false;
			btn_check_virus.visible = false;

			btn_error_botnet.visible = false;
			btn_error_hack.visible = false;
			btn_error_virus.visible = false;
			btn_error_trojan.visible = false;

			btn_verify.visible = false;
			btn_retry.visible = false;

			clip_trojan.visible = true;
			clip_virus.visible = true;
			clip_hacker.visible = true;
			clip_botnet.visible = true;
		}
		public function Animar1(e: MouseEvent) {
			var nombre_btn: String = "";
			nombre_btn = e.target.name;

			switch (nombre_btn) {
				case "btn_check_trojan":
					clip_escenario1.visible = true;
					clip_escenario1.x = 184;
					clip_escenario1.y = 9;
					clip_escenario2.visible = false;
					clip_escenario3.visible = false;
					clip_escenario4.visible = false;

					clip_escenario1.gotoAndPlay(1);

					btn_retry.visible = false;
					btn_verify.visible = false;
					break;
				case "btn_check_hack":
					clip_escenario1.visible = false;
					clip_escenario2.visible = true;
					clip_escenario2.x = 184;
					clip_escenario2.y = 9;
					clip_escenario3.visible = false;
					clip_escenario4.visible = false;

					clip_escenario2.gotoAndPlay(1);

					btn_retry.visible = false;
					btn_verify.visible = false;
					break;
				case "btn_check_botnet":
					clip_escenario1.visible = false;
					clip_escenario2.visible = false;
					clip_escenario3.visible = false;
					clip_escenario4.visible = true;
					clip_escenario4.x = 184;
					clip_escenario4.y = 9;

					clip_escenario4.gotoAndPlay(1);

					btn_retry.visible = false;
					btn_verify.visible = false;
					break;
				case "btn_check_virus":
					clip_escenario1.visible = false;
					clip_escenario2.visible = false;
					clip_escenario3.visible = true;
					clip_escenario3.x = 184;
					clip_escenario3.y = 9
					clip_escenario4.visible = false;

					clip_escenario3.gotoAndPlay(1);

					btn_retry.visible = false;
					btn_verify.visible = false;
					break;
			}
		}

		public function CerrarVentana1(e: MouseEvent) {
			clip_escenario1.visible = false;
			clip_escenario1.x = 300;
			clip_escenario2.visible = false;
			clip_escenario3.visible = false;
			clip_escenario4.visible = false;

			btn_retry.visible = true;
		}
		//**************************************************************************************
		//FIN DEL BLOQUE ACTIVIDAD 1 DE DRAG AND DROP
		//**************************************************************************************
	}

}