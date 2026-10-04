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
			Aux_pantalla = 1;
			gotoAndStop(5);
			mostrarContenido();
			Multitouch.inputMode = MultitouchInputMode.GESTURE;
			//stage.addEventListener(TransformGestureEvent.GESTURE_SWIPE, deslizarContenido);
			btn_next.addEventListener(MouseEvent.CLICK, siguienteFrame);
			btn_prev.addEventListener(MouseEvent.CLICK, previoFrame);
		}

		public function siguienteFrame(e: MouseEvent) {
			mostrarContenido();
			if (Aux_pantalla >= 1 && Aux_pantalla <= 100) {
				Aux_pantalla++;
				nextFrame();
				mostrarContenido();
			}
		}
		public function previoFrame(e: MouseEvent) {
			mostrarContenido();
			if (Aux_pantalla <= 100 && Aux_pantalla > 1) {
				Aux_pantalla--;
				prevFrame();
				mostrarContenido();
			} else {
				trace("Estamos saliendo del flujo");
			}
		}

		/*public function deslizarContenido(e: TransformGestureEvent) {
			mostrarContenido();
			if (e.offsetX == 1 && Aux_pantalla > 1) {
				prevFrame();
				Aux_pantalla--;
			}
			if (e.offsetX == -1 && Aux_pantalla < 100) {
				nextFrame();
				Aux_pantalla++;
			}
		}*/
		public function mostrarContenido() {
			switch (Aux_pantalla) {
				case 1:
					actividad1(); //Actividad 1 Drag and Drop
					break;
				case 2:
					actividad2(); //Actividad 2 Drag and Drop
					break;
				case 3:
					//actividad3(); //Actividad 3 Drag and Drop
					break;
				case 4:
					//actividad4(); //Actividad 4 Drag and Drop
					break;
				case 5:
					//actividad5(); //Actividad 5 Drag and Drop
					break;
				case 6:
					//actividad6(); //Actividad 6 Drag and Drop
					break;
				case 9:
					actividad7(); //Actividad 1 Colision
					break;
				case 10:
					actividad8(); //Actividad 2 Colision
					break;
				case 11:
					actividad9(); //Actividad 3 Colision
					break;
				case 12:
					actividad10(); //Actividad 4 Colision
					break;
				case 13:
					actividad11(); //Actividad 5 Colision
					break;
				case 14:
					actividad12(); //Actividad 6 Colision
					break;
			}
		}
	}

}