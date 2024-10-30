/*
CONSTANTS:
    - leccion_tipo: blocks, bubbles, sky, beach
    - tipo_material: imagen, audio, palabra
*/

/*
NEEDS FOR LESSON TYPE:
    - blocks: 1 image, 1 audio, n words
    - bubbles: 1 audio, n words
    - sky: 3 images, 3 audios, 3 words
    - beach: 3 images, 1 audio 
*/

/*Nivel 1*/
INSERT INTO nivel (nombre) VALUES ('Nivel 1: Vocales');

/*Lección 1*/
INSERT INTO lecciones (id_nivel, titulo) VALUES (1, 'Lección 1: Vocales');

/*Material para etapas, lección 1*/

/*Etapa 1: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (1, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (1, 'audio', 'assets/audio/lessons/lesson1/a.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (1, 'palabra', 'a');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (1, 'palabra', 'e');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (1, 'palabra', 'i');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (1, 'palabra', 'o');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (1, 'palabra', 'u');

/*Etapa 2: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (1, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (2, 'audio', 'assets/audio/lessons/lesson1/i.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (2, 'palabra', 'i');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (2, 'palabra', 'e');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (2, 'palabra', 'a');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (2, 'palabra', 'o');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (2, 'palabra', 'u');

/*Etapa 3: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (1, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (3, 'audio', 'assets/audio/lessons/lesson1/u.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (3, 'palabra', 'u');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (3, 'palabra', 'e');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (3, 'palabra', 'i');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (3, 'palabra', 'a');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (3, 'palabra', 'o');

/*Etapa 2: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (1, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (4, 'audio', 'assets/audio/lessons/lesson1/e.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (4, 'palabra', 'e');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (4, 'palabra', 'a');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (4, 'palabra', 'i');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (4, 'palabra', 'o');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (4, 'palabra', 'u');

/*Etapa 2: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (1, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (5, 'audio', 'assets/audio/lessons/lesson1/o.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (5, 'palabra', 'o');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (5, 'palabra', 'e');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (5, 'palabra', 'i');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (5, 'palabra', 'a');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (5, 'palabra', 'u');

/*Nivel 2*/
INSERT INTO nivel (nombre) VALUES ('Nivel 2: Sílabas parte 1');

/*Lección 2*/
INSERT INTO lecciones (id_nivel, titulo) VALUES (2, 'Lección 2');

/*Material para etapas, lección 2*/

/*Etapa 1: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (2, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (6, 'imagen', 'assets/images/lesson2/manzana.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (6, 'audio', 'assets/audio/lessons/lesson2/manzana.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (6, 'palabra', 'man');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (6, 'palabra', 'za');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (6, 'palabra', 'na');

/*Etapa 2: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (2, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (7, 'audio', 'assets/audio/lessons/lesson2/me.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (7, 'palabra', 'me');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (7, 'palabra', 'ma');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (7, 'palabra', 'mi');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (7, 'palabra', 'mo');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (7, 'palabra', 'mu');

/*Etapa 3: sky*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (2, 'sky', 'assets/audio/VoiceHelp/LeccionCielo.mp3', 'assets/Music/Sky2.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (8, 'imagen', 'assets/images/lesson2/mirar.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (8, 'audio', 'assets/audio/lessons/lesson2/mirar.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (8, 'palabra', 'mirar');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (8, 'imagen', 'assets/images/lesson2/minar.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (8, 'audio', 'assets/audio/lessons/lesson2/minar.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (8, 'palabra', 'minar');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (8, 'imagen', 'assets/images/lesson2/miedo.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (8, 'audio', 'assets/audio/lessons/lesson2/miedo.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (8, 'palabra', 'miedo');

/*Etapa 4: beach*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (2, 'beach', 'assets/audio/VoiceHelp/LeccionPlaya.mp3', 'assets/Music/Beach.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (9, 'audio', 'assets/audio/lessons/lesson2/monio.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (9, 'imagen', 'assets/images/lesson2/monio.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (9, 'imagen', 'assets/images/lesson2/mono.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (9, 'imagen', 'assets/images/lesson2/moto.png');

/*Etapa 5*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (2, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (10, 'imagen', 'assets/images/lesson2/munieca.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (10, 'audio', 'assets/audio/lessons/lesson2/munieca.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (10, 'palabra', 'mu');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (10, 'palabra', 'ñe');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (10, 'palabra', 'ca');

/*Lección 3*/
INSERT INTO lecciones (id_nivel, titulo) VALUES (2, 'Lección 3: Sílabas con S');

/*Material para etapas, lección 3*/

/*Etapa 1: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (3, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (11, 'audio', 'assets/audio/lessons/lesson3/sa.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (11, 'palabra', 'sa');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (11, 'palabra', 'si');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (11, 'palabra', 'so');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (11, 'palabra', 'su');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (11, 'palabra', 'se');

/*Etapa 2: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (3, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (12, 'imagen', 'assets/images/lesson3/serrucho.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (12, 'audio', 'assets/audio/lessons/lesson3/serrucho.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (12, 'palabra', 'se');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (12, 'palabra', 'rru');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (12, 'palabra', 'cho');

/*Etapa 3: beach*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (3, 'beach', 'assets/audio/VoiceHelp/LeccionPlaya.mp3', 'assets/Music/Beach.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (13, 'audio', 'assets/audio/lessons/lesson3/silla.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (13, 'imagen', 'assets/images/lesson3/silla.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (13, 'imagen', 'assets/images/lesson3/silbato.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (13, 'imagen', 'assets/images/lesson3/sirena.png');

/*Etapa 4: sky*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (3, 'sky', 'assets/audio/VoiceHelp/LeccionCielo.mp3', 'assets/Music/Sky2.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (14, 'imagen', 'assets/images/lesson3/sopa.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (14, 'audio', 'assets/audio/lessons/lesson3/sopa.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (14, 'palabra', 'sopa');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (14, 'imagen', 'assets/images/lesson3/sombra.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (14, 'audio', 'assets/audio/lessons/lesson3/sombra.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (14, 'palabra', 'sombra');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (14, 'imagen', 'assets/images/lesson3/sonido.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (14, 'audio', 'assets/audio/lessons/lesson3/sonido.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (14, 'palabra', 'sonido');

/*Etapa 5*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (3, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (15, 'imagen', 'assets/images/lesson3/suelo.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (15, 'audio', 'assets/audio/lessons/lesson3/suelo.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (15, 'palabra', 'sue');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (15, 'palabra', 'lo');

/*Lección 4*/
INSERT INTO lecciones (id_nivel, titulo) VALUES (2, 'Lección 4: Sílabas con L');

/*Material para etapas, lección 4*/

/*Etapa 1: sky*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (4, 'sky', 'assets/audio/VoiceHelp/LeccionCielo.mp3', 'assets/Music/Sky2.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (16, 'imagen', 'assets/images/lesson4/lapiz.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (16, 'audio', 'assets/audio/lessons/lesson4/lapiz.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (16, 'palabra', 'lápiz');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (16, 'imagen', 'assets/images/lesson4/lago.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (16, 'audio', 'assets/audio/lessons/lesson4/lago.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (16, 'palabra', 'lago');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (16, 'imagen', 'assets/images/lesson4/ladrillo.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (16, 'audio', 'assets/audio/lessons/lesson4/ladrillo.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (16, 'palabra', 'ladrillo');

/*Etapa 2: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (4, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (17, 'imagen', 'assets/images/lesson4/leche.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (17, 'audio', 'assets/audio/lessons/lesson4/leche.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (17, 'palabra', 'le');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (17, 'palabra', 'che');

/*Etapa 3: beach*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (4, 'beach', 'assets/audio/VoiceHelp/LeccionPlaya.mp3', 'assets/Music/Beach.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (18, 'audio', 'assets/audio/lessons/lesson4/libro.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (18, 'imagen', 'assets/images/lesson4/libro.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (18, 'imagen', 'assets/images/lesson4/limpiar.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (18, 'imagen', 'assets/images/lesson4/lima.png');

/*Etapa 4: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (4, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (19, 'audio', 'assets/audio/lessons/lesson4/lo.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (19, 'palabra', 'lo');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (19, 'palabra', 'la');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (19, 'palabra', 'le');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (19, 'palabra', 'li');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (19, 'palabra', 'lu');

/*Etapa 5*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (4, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (20, 'imagen', 'assets/images/lesson4/luna.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (20, 'audio', 'assets/audio/lessons/lesson4/luna.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (20, 'palabra', 'lu');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (20, 'palabra', 'na');

/*Lección 5*/
INSERT INTO lecciones (id_nivel, titulo) VALUES (2, 'Lección 5: Sílabas con T');

/*Material para etapas, lección 5*/

/*Etapa 1: beach*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (5, 'beach', 'assets/audio/VoiceHelp/LeccionPlaya.mp3', 'assets/Music/Beach.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (21, 'audio', 'assets/audio/lessons/lesson5/taza.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (21, 'imagen', 'assets/images/lesson5/taza.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (21, 'imagen', 'assets/images/lesson5/taco.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (21, 'imagen', 'assets/images/lesson5/tarea.png');

/*Etapa 2: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (5, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (22, 'imagen', 'assets/images/lesson5/tenedor.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (22, 'audio', 'assets/audio/lessons/lesson5/tenedor.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (22, 'palabra', 'te');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (22, 'palabra', 'ne');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (22, 'palabra', 'dor');

/*Etapa 3: sky*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (5, 'sky', 'assets/audio/VoiceHelp/LeccionCielo.mp3', 'assets/Music/Sky2.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (23, 'imagen', 'assets/images/lesson5/tigre.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (23, 'audio', 'assets/audio/lessons/lesson5/tigre.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (23, 'palabra', 'tigre');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (23, 'imagen', 'assets/images/lesson5/tienda.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (23, 'audio', 'assets/audio/lessons/lesson5/tienda.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (23, 'palabra', 'tienda');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (23, 'imagen', 'assets/images/lesson5/tijeras.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (23, 'audio', 'assets/audio/lessons/lesson5/tijeras.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (23, 'palabra', 'tijeras');

/*Etapa 4: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (5, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (24, 'audio', 'assets/audio/lessons/lesson5/to.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (24, 'palabra', 'to');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (24, 'palabra', 'tu');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (24, 'palabra', 'ta');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (24, 'palabra', 'ti');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (24, 'palabra', 'te');

/*Etapa 5: beach*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (5, 'beach', 'assets/audio/VoiceHelp/LeccionPlaya.mp3', 'assets/Music/Beach.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (25, 'audio', 'assets/audio/lessons/lesson5/tumba.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (25, 'imagen', 'assets/images/lesson5/tumba.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (25, 'imagen', 'assets/images/lesson5/turista.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (25, 'imagen', 'assets/images/lesson5/tucan.png');

/*Lección 6*/
INSERT INTO lecciones (id_nivel, titulo) VALUES (2, 'Lección 6: Sílabas con P');

/*Material para etapas, lección 6*/

/*Etapa 1: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (6, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (26, 'imagen', 'assets/images/lesson6/pato.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (26, 'audio', 'assets/audio/lessons/lesson6/pato.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (26, 'palabra', 'pa');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (26, 'palabra', 'to');

/*Etapa 2: beach*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (6, 'beach', 'assets/audio/VoiceHelp/LeccionPlaya.mp3', 'assets/Music/Beach.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (27, 'audio', 'assets/audio/lessons/lesson6/pez.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (27, 'imagen', 'assets/images/lesson6/pez.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (27, 'imagen', 'assets/images/lesson6/pelota.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (27, 'imagen', 'assets/images/lesson6/perro.png');

/*Etapa 3: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (6, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (28, 'audio', 'assets/audio/lessons/lesson6/pi.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (28, 'palabra', 'pi');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (28, 'palabra', 'pa');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (28, 'palabra', 'pe');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (28, 'palabra', 'po');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (28, 'palabra', 'pu');

/*Etapa 4: sky*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (6, 'sky', 'assets/audio/VoiceHelp/LeccionCielo.mp3', 'assets/Music/Sky2.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (29, 'imagen', 'assets/images/lesson6/pollo.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (29, 'audio', 'assets/audio/lessons/lesson6/pollo.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (29, 'palabra', 'pollo');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (29, 'imagen', 'assets/images/lesson6/pozo.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (29, 'audio', 'assets/audio/lessons/lesson6/pozo.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (29, 'palabra', 'pozo');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (29, 'imagen', 'assets/images/lesson6/poste.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (29, 'audio', 'assets/audio/lessons/lesson6/poste.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (29, 'palabra', 'poste');

/*Etapa 5: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (6, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (30, 'imagen', 'assets/images/lesson6/pulpo.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (30, 'audio', 'assets/audio/lessons/lesson6/pulpo.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (30, 'palabra', 'pul');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (30, 'palabra', 'po');

/*Nivel 3*/
INSERT INTO nivel (nombre) VALUES ('Nivel 3: Sílabas parte 2');

/*Lección 7*/
INSERT INTO lecciones (id_nivel, titulo) VALUES (3, 'Lección 7: Sílabas con R');

/*Material para etapas, lección 7*/

/*Etapa 1: beach*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (7, 'beach', 'assets/audio/VoiceHelp/LeccionPlaya.mp3', 'assets/Music/Beach.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (31, 'audio', 'assets/audio/lessons/lesson7/raton.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (31, 'imagen', 'assets/images/lesson7/raton.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (31, 'imagen', 'assets/images/lesson7/rana.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (31, 'imagen', 'assets/images/lesson7/radio.png');

/*Etapa 2: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (7, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (32, 'imagen', 'assets/images/lesson7/regalo.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (32, 'audio', 'assets/audio/lessons/lesson7/regalo.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (32, 'palabra', 're');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (32, 'palabra', 'ga');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (32, 'palabra', 'lo');

/*Etapa 3: sky*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (7, 'sky', 'assets/audio/VoiceHelp/LeccionCielo.mp3', 'assets/Music/Sky2.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (33, 'imagen', 'assets/images/lesson7/ropa.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (33, 'audio', 'assets/audio/lessons/lesson7/ropa.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (33, 'palabra', 'ropa');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (33, 'imagen', 'assets/images/lesson7/rodilla.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (33, 'audio', 'assets/audio/lessons/lesson7/rodilla.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (33, 'palabra', 'rodilla');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (33, 'imagen', 'assets/images/lesson7/rojo.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (33, 'audio', 'assets/audio/lessons/lesson7/rojo.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (33, 'palabra', 'rojo');

/*Etapa 4: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (7, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (34, 'audio', 'assets/audio/lessons/lesson7/ro.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (34, 'palabra', 'ro');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (34, 'palabra', 'ra');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (34, 'palabra', 're');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (34, 'palabra', 'ri');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (34, 'palabra', 'ru');

/*Etapa 5: beach*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (7, 'beach', 'assets/audio/VoiceHelp/LeccionPlaya.mp3', 'assets/Music/Beach.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (35, 'audio', 'assets/audio/lessons/lesson7/rueda.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (35, 'imagen', 'assets/images/lesson7/rueda.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (35, 'imagen', 'assets/images/lesson7/rubio.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (35, 'imagen', 'assets/images/lesson7/ruido.png');

/*Lección 8*/
INSERT INTO lecciones (id_nivel, titulo) VALUES (3, 'Lección 8: Sílabas con N');

/*Material para etapas, lección 8*/

/*Etapa 1: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (8, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (36, 'imagen', 'assets/images/lesson8/naranja.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (36, 'audio', 'assets/audio/lessons/lesson8/naranja.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (36, 'palabra', 'na');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (36, 'palabra', 'ran');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (36, 'palabra', 'ja');

/*Etapa 2: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (8, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (37, 'audio', 'assets/audio/lessons/lesson8/ne.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (37, 'palabra', 'ne');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (37, 'palabra', 'na');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (37, 'palabra', 'ni');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (37, 'palabra', 'nu');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (37, 'palabra', 'no');

/*Etapa 3: sky*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (8, 'sky', 'assets/audio/VoiceHelp/LeccionCielo.mp3', 'assets/Music/Sky2.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (38, 'imagen', 'assets/images/lesson8/ninio.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (38, 'audio', 'assets/audio/lessons/lesson8/ninio.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (38, 'palabra', 'niño');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (38, 'imagen', 'assets/images/lesson8/nido.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (38, 'audio', 'assets/audio/lessons/lesson8/nido.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (38, 'palabra', 'nido');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (38, 'imagen', 'assets/images/lesson8/nieve.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (38, 'audio', 'assets/audio/lessons/lesson8/nieve.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (38, 'palabra', 'nieve');

/*Etapa 4: beach*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (8, 'beach', 'assets/audio/VoiceHelp/LeccionPlaya.mp3', 'assets/Music/Beach.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (39, 'audio', 'assets/audio/lessons/lesson8/noche.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (39, 'imagen', 'assets/images/lesson8/noche.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (39, 'imagen', 'assets/images/lesson8/nota.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (39, 'imagen', 'assets/images/lesson8/norte.png');

/*Etapa 5: beach*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (8, 'beach', 'assets/audio/VoiceHelp/LeccionPlaya.mp3', 'assets/Music/Beach.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (40, 'audio', 'assets/audio/lessons/lesson8/nube.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (40, 'imagen', 'assets/images/lesson8/nube.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (40, 'imagen', 'assets/images/lesson8/nutria.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (40, 'imagen', 'assets/images/lesson8/nuez.png');

/*Lección 9*/
INSERT INTO lecciones (id_nivel, titulo) VALUES (3, 'Lección 9: Sílabas con C');

/*Material para etapas, lección 9*/

/*Etapa 1: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (9, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (41, 'imagen', 'assets/images/lesson9/casa.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (41, 'audio', 'assets/audio/lessons/lesson9/casa.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (41, 'palabra', 'ca');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (41, 'palabra', 'sa');

/*Etapa 2: sky*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (9, 'sky', 'assets/audio/VoiceHelp/LeccionCielo.mp3', 'assets/Music/Sky2.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (42, 'imagen', 'assets/images/lesson9/cepillo.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (42, 'audio', 'assets/audio/lessons/lesson9/cepillo.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (42, 'palabra', 'cepillo');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (42, 'imagen', 'assets/images/lesson9/cena.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (42, 'audio', 'assets/audio/lessons/lesson9/cena.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (42, 'palabra', 'cena');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (42, 'imagen', 'assets/images/lesson9/cerdo.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (42, 'audio', 'assets/audio/lessons/lesson9/cerdo.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (42, 'palabra', 'cerdo');

/*Etapa 3: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (9, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (43, 'audio', 'assets/audio/lessons/lesson9/ci.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (43, 'palabra', 'ci');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (43, 'palabra', 'ca');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (43, 'palabra', 'ce');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (43, 'palabra', 'co');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (43, 'palabra', 'cu');

/*Etapa 4: beach*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (9, 'beach', 'assets/audio/VoiceHelp/LeccionPlaya.mp3', 'assets/Music/Beach.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (44, 'audio', 'assets/audio/lessons/lesson9/conejo.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (44, 'imagen', 'assets/images/lesson9/conejo.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (44, 'imagen', 'assets/images/lesson9/cometa.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (44, 'imagen', 'assets/images/lesson9/comida.png');

/*Etapa 5: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (9, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (45, 'audio', 'assets/audio/lessons/lesson9/cu.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (45, 'palabra', 'cu');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (45, 'palabra', 'ca');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (45, 'palabra', 'ce');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (45, 'palabra', 'ci');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (45, 'palabra', 'co');

/*Lección 10*/
INSERT INTO lecciones (id_nivel, titulo) VALUES (3, 'Lección 10: Sílabas con Q');

/*Material para etapas, lección 10*/

/*Etapa 1: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (10, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (46, 'audio', 'assets/audio/lessons/lesson10/qui.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (46, 'palabra', 'qui');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (46, 'palabra', 'que');

/*Etapa 2: sky*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (10, 'sky', 'assets/audio/VoiceHelp/LeccionCielo.mp3', 'assets/Music/Sky2.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (47, 'imagen', 'assets/images/lesson10/queso.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (47, 'audio', 'assets/audio/lessons/lesson10/queso.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (47, 'palabra', 'queso');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (47, 'imagen', 'assets/images/lesson10/queja.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (47, 'audio', 'assets/audio/lessons/lesson10/queja.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (47, 'palabra', 'queja');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (47, 'imagen', 'assets/images/lesson10/quema.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (47, 'audio', 'assets/audio/lessons/lesson10/quema.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (47, 'palabra', 'quema');

/*Etapa 3: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (10, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (48, 'imagen', 'assets/images/lesson10/quince.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (48, 'audio', 'assets/audio/lessons/lesson10/quince.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (48, 'palabra', 'quin');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (48, 'palabra', 'ce');

/*Etapa 4: beach*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (10, 'beach', 'assets/audio/VoiceHelp/LeccionPlaya.mp3', 'assets/Music/Beach.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (49, 'audio', 'assets/audio/lessons/lesson10/quedarse.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (49, 'imagen', 'assets/images/lesson10/quedarse.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (49, 'imagen', 'assets/images/lesson10/querido.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (49, 'imagen', 'assets/images/lesson10/quehacer.png');

/*Etapa 5: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (10, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (50, 'audio', 'assets/audio/lessons/lesson10/que.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (50, 'palabra', 'que');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (50, 'palabra', 'qui');

/*Lección 11*/
INSERT INTO lecciones (id_nivel, titulo) VALUES (3, 'Lección 11: Sílabas con D');

/*Material para etapas, lección 11*/

/*Etapa 1: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (11, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (51, 'imagen', 'assets/images/lesson11/dado.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (51, 'audio', 'assets/audio/lessons/lesson11/dado.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (51, 'palabra', 'da');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (51, 'palabra', 'do');

/*Etapa 2: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (11, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (52, 'audio', 'assets/audio/lessons/lesson11/de.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (52, 'palabra', 'de');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (52, 'palabra', 'da');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (52, 'palabra', 'di');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (52, 'palabra', 'do');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (52, 'palabra', 'du');

/*Etapa 3: sky*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (11, 'sky', 'assets/audio/VoiceHelp/LeccionCielo.mp3', 'assets/Music/Sky2.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (53, 'imagen', 'assets/images/lesson11/dedo.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (53, 'audio', 'assets/audio/lessons/lesson11/dedo.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (53, 'palabra', 'dedo');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (53, 'imagen', 'assets/images/lesson11/delfin.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (53, 'audio', 'assets/audio/lessons/lesson11/delfin.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (53, 'palabra', 'delfin');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (53, 'imagen', 'assets/images/lesson11/dia.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (53, 'audio', 'assets/audio/lessons/lesson11/dia.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (53, 'palabra', 'dia');

/*Etapa 4: beach*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (11, 'beach', 'assets/audio/VoiceHelp/LeccionPlaya.mp3', 'assets/Music/Beach.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (54, 'audio', 'assets/audio/lessons/lesson11/don.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (54, 'imagen', 'assets/images/lesson11/don.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (54, 'imagen', 'assets/images/lesson11/dormir.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (54, 'imagen', 'assets/images/lesson11/dulce.png');

/*Etapa 5: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (11, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (55, 'audio', 'assets/audio/lessons/lesson11/du.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (55, 'palabra', 'du');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (55, 'palabra', 'da');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (55, 'palabra', 'de');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (55, 'palabra', 'di');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (55, 'palabra', 'do');

/*Nivel 4*/
INSERT INTO nivel (nombre) VALUES ('Nivel 4: Sílabas parte 3');

/*Lección 12*/
INSERT INTO lecciones (id_nivel, titulo) VALUES (4, 'Lección 12: Sílabas con V');

/*Material para etapas, lección 12*/

/*Etapa 1: sky*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (12, 'sky', 'assets/audio/VoiceHelp/LeccionCielo.mp3', 'assets/Music/Sky2.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (56, 'imagen', 'assets/images/lesson12/vaca.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (56, 'audio', 'assets/audio/lessons/lesson12/vaca.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (56, 'palabra', 'vaca');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (56, 'imagen', 'assets/images/lesson12/vaso.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (56, 'audio', 'assets/audio/lessons/lesson12/vaso.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (56, 'palabra', 'vaso');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (56, 'imagen', 'assets/images/lesson12/vela.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (56, 'audio', 'assets/audio/lessons/lesson12/vela.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (56, 'palabra', 'vela');

/*Etapa 2: beach*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (12, 'beach', 'assets/audio/VoiceHelp/LeccionPlaya.mp3', 'assets/Music/Beach.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (57, 'audio', 'assets/audio/lessons/lesson12/volcan.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (57, 'imagen', 'assets/images/lesson12/volcan.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (57, 'imagen', 'assets/images/lesson12/viento.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (57, 'imagen', 'assets/images/lesson12/violeta.png');

/*Etapa 3: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (12, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (58, 'audio', 'assets/audio/lessons/lesson12/vi.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (58, 'palabra', 'vi');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (58, 'palabra', 'va');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (58, 'palabra', 've');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (58, 'palabra', 'vo');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (58, 'palabra', 'vu');

/*Etapa 4: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (12, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (59, 'imagen', 'assets/images/lesson12/ventana.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (59, 'audio', 'assets/audio/lessons/lesson12/ventana.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (59, 'palabra', 'ven');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (59, 'palabra', 'ta');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (59, 'palabra', 'na');

/*Etapa 5: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (12, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (60, 'imagen', 'assets/images/lesson12/vino.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (60, 'audio', 'assets/audio/lessons/lesson12/vino.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (60, 'palabra', 'vi');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (60, 'palabra', 'no');

/*Lección 13*/
INSERT INTO lecciones (id_nivel, titulo) VALUES (4, 'Lección 13: Sílabas con J');

/*Material para etapas, lección 13*/

/*Etapa 1: sky*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (13, 'sky', 'assets/audio/VoiceHelp/LeccionCielo.mp3', 'assets/Music/Sky2.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (61, 'imagen', 'assets/images/lesson13/jirafa.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (61, 'audio', 'assets/audio/lessons/lesson13/jirafa.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (61, 'palabra', 'jirafa');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (61, 'imagen', 'assets/images/lesson13/jugo.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (61, 'audio', 'assets/audio/lessons/lesson13/jugo.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (61, 'palabra', 'jugo');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (61, 'imagen', 'assets/images/lesson13/jardin.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (61, 'audio', 'assets/audio/lessons/lesson13/jardin.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (61, 'palabra', 'jardín');

/*Etapa 2: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (13, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (62, 'imagen', 'assets/images/lesson13/jabon.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (62, 'audio', 'assets/audio/lessons/lesson13/jabon.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (62, 'palabra', 'ja');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (62, 'palabra', 'bón');

/*Etapa 3: beach*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (13, 'beach', 'assets/audio/VoiceHelp/LeccionPlaya.mp3', 'assets/Music/Beach.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (63, 'audio', 'assets/audio/lessons/lesson13/juguete.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (63, 'imagen', 'assets/images/lesson13/juguete.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (63, 'imagen', 'assets/images/lesson13/jugo.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (63, 'imagen', 'assets/images/lesson13/jirafa.png');

/*Etapa 4: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (13, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (64, 'audio', 'assets/audio/lessons/lesson13/jo.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (64, 'palabra', 'jo');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (64, 'palabra', 'ja');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (64, 'palabra', 'je');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (64, 'palabra', 'ji');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (64, 'palabra', 'ju');

/*Etapa 5: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (13, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (65, 'audio', 'assets/audio/lessons/lesson13/ju.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (65, 'palabra', 'ju');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (65, 'palabra', 'ja');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (65, 'palabra', 'je');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (65, 'palabra', 'ji');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (65, 'palabra', 'jo');

/*Lección 14*/
INSERT INTO lecciones (id_nivel, titulo) VALUES (4, 'Lección 14: Sílabas con F');

/*Material para etapas, lección 14*/

/*Etapa 1: sky*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (14, 'sky', 'assets/audio/VoiceHelp/LeccionCielo.mp3', 'assets/Music/Sky2.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (66, 'imagen', 'assets/images/lesson14/foca.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (66, 'audio', 'assets/audio/lessons/lesson14/foca.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (66, 'palabra', 'foca');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (66, 'imagen', 'assets/images/lesson14/faro.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (66, 'audio', 'assets/audio/lessons/lesson14/faro.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (66, 'palabra', 'faro');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (66, 'imagen', 'assets/images/lesson14/familia.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (66, 'audio', 'assets/audio/lessons/lesson14/familia.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (66, 'palabra', 'familia');

/*Etapa 2: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (14, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (67, 'audio', 'assets/audio/lessons/lesson14/fe.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (67, 'palabra', 'fe');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (67, 'palabra', 'fa');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (67, 'palabra', 'fi');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (67, 'palabra', 'fo');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (67, 'palabra', 'fu');

/*Etapa 3: beach*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (14, 'beach', 'assets/audio/VoiceHelp/LeccionPlaya.mp3', 'assets/Music/Beach.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (68, 'audio', 'assets/audio/lessons/lesson14/fuego.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (68, 'imagen', 'assets/images/lesson14/fuego.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (68, 'imagen', 'assets/images/lesson14/fresa.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (68, 'imagen', 'assets/images/lesson14/flauta.png');

/*Etapa 4: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (14, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (69, 'imagen', 'assets/images/lesson14/falda.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (69, 'audio', 'assets/audio/lessons/lesson14/falda.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (69, 'palabra', 'fal');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (69, 'palabra', 'da');

/*Etapa 5: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (14, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (70, 'imagen', 'assets/images/lesson14/foto.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (70, 'audio', 'assets/audio/lessons/lesson14/foto.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (70, 'palabra', 'fo');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (70, 'palabra', 'to');

/*Lección 15*/
INSERT INTO lecciones (id_nivel, titulo) VALUES (4, 'Lección 15: Sílabas con B');

/*Material para etapas, lección 15*/

/*Etapa 1: sky*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (15, 'sky', 'assets/audio/VoiceHelp/LeccionCielo.mp3', 'assets/Music/Sky2.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (71, 'imagen', 'assets/images/lesson15/barco.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (71, 'audio', 'assets/audio/lessons/lesson15/barco.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (71, 'palabra', 'barco');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (71, 'imagen', 'assets/images/lesson15/banco.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (71, 'audio', 'assets/audio/lessons/lesson15/banco.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (71, 'palabra', 'banco');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (71, 'imagen', 'assets/images/lesson15/biberon.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (71, 'audio', 'assets/audio/lessons/lesson15/biberon.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (71, 'palabra', 'biberón');

/*Etapa 2: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (15, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (72, 'audio', 'assets/audio/lessons/lesson15/ba.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (72, 'palabra', 'ba');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (72, 'palabra', 'be');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (72, 'palabra', 'bi');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (72, 'palabra', 'bo');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (72, 'palabra', 'bu');

/*Etapa 3: beach*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (15, 'beach', 'assets/audio/VoiceHelp/LeccionPlaya.mp3', 'assets/Music/Beach.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (73, 'audio', 'assets/audio/lessons/lesson15/bote.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (73, 'imagen', 'assets/images/lesson15/bote.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (73, 'imagen', 'assets/images/lesson15/burro.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (73, 'imagen', 'assets/images/lesson15/bosque.png');

/*Etapa 4: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (15, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (74, 'imagen', 'assets/images/lesson15/balon.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (74, 'audio', 'assets/audio/lessons/lesson15/balon.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (74, 'palabra', 'ba');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (74, 'palabra', 'lón');

/*Etapa 5: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (15, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (75, 'audio', 'assets/audio/lessons/lesson15/bu.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (75, 'palabra', 'bu');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (75, 'palabra', 'ba');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (75, 'palabra', 'be');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (75, 'palabra', 'bi');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (75, 'palabra', 'bo');

/*Lección 16*/
INSERT INTO lecciones (id_nivel, titulo) VALUES (4, 'Lección 16: Sílabas con Ñ');

/*Material para etapas, lección 16*/

/*Etapa 1: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (16, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (76, 'audio', 'assets/audio/lessons/lesson16/nia.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (76, 'palabra', 'ña');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (76, 'palabra', 'ñe');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (76, 'palabra', 'ñi');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (76, 'palabra', 'ño');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (76, 'palabra', 'ñu');

/*Etapa 2: beach*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (16, 'beach', 'assets/audio/VoiceHelp/LeccionPlaya.mp3', 'assets/Music/Beach.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (77, 'audio', 'assets/audio/lessons/lesson16/ninio.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (77, 'imagen', 'assets/images/lesson16/ninio.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (77, 'imagen', 'assets/images/lesson16/canion.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (77, 'imagen', 'assets/images/lesson16/banio.png');

/*Etapa 3: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (16, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (78, 'imagen', 'assets/images/lesson16/arania.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (78, 'audio', 'assets/audio/lessons/lesson16/arania.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (78, 'palabra', 'ara');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (78, 'palabra', 'ña');

/*Etapa 4: sky*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (16, 'sky', 'assets/audio/VoiceHelp/LeccionCielo.mp3', 'assets/Music/Sky2.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (79, 'imagen', 'assets/images/lesson16/cania.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (79, 'audio', 'assets/audio/lessons/lesson16/cania.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (79, 'palabra', 'caña');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (79, 'imagen', 'assets/images/lesson16/ninia.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (79, 'audio', 'assets/audio/lessons/lesson16/ninia.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (79, 'palabra', 'niña');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (79, 'imagen', 'assets/images/lesson16/punio.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (79, 'audio', 'assets/audio/lessons/lesson16/punio.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (79, 'palabra', 'puño');

/*Etapa 5: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (16, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (80, 'audio', 'assets/audio/lessons/lesson16/nio.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (80, 'palabra', 'ño');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (80, 'palabra', 'ña');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (80, 'palabra', 'ñe');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (80, 'palabra', 'ñi');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (80, 'palabra', 'ñu');

/*Nivel 5*/
INSERT INTO nivel (nombre) VALUES ('Nivel 5: Sílabas parte 4');

/*Lección 17*/
INSERT INTO lecciones (id_nivel, titulo) VALUES (5, 'Lección 17: Sílabas con G');

/*Material para etapas, lección 17*/

/*Etapa 1: beach*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (17, 'beach', 'assets/audio/VoiceHelp/LeccionPlaya.mp3', 'assets/Music/Beach.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (81, 'audio', 'assets/audio/lessons/lesson17/gato.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (81, 'imagen', 'assets/images/lesson17/gato.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (81, 'imagen', 'assets/images/lesson17/goma.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (81, 'imagen', 'assets/images/lesson17/guitarra.png');

/*Etapa 2: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (17, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (82, 'imagen', 'assets/images/lesson17/gente.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (82, 'audio', 'assets/audio/lessons/lesson17/gente.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (82, 'palabra', 'gen');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (82, 'palabra', 'te');

/*Etapa 3: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (17, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (83, 'audio', 'assets/audio/lessons/lesson17/gi.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (83, 'palabra', 'gi');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (83, 'palabra', 'ga');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (83, 'palabra', 'ge');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (83, 'palabra', 'go');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (83, 'palabra', 'gu');

/*Etapa 4: sky*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (17, 'sky', 'assets/audio/VoiceHelp/LeccionCielo.mp3', 'assets/Music/Sky2.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (84, 'imagen', 'assets/images/lesson17/gota.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (84, 'audio', 'assets/audio/lessons/lesson17/gota.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (84, 'palabra', 'gota');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (84, 'imagen', 'assets/images/lesson17/golpe.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (84, 'audio', 'assets/audio/lessons/lesson17/golpe.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (84, 'palabra', 'golpe');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (84, 'imagen', 'assets/images/lesson17/gordo.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (84, 'audio', 'assets/audio/lessons/lesson17/gordo.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (84, 'palabra', 'gordo');

/*Etapa 5: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (17, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (85, 'imagen', 'assets/images/lesson17/gusano.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (85, 'audio', 'assets/audio/lessons/lesson17/gusano.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (85, 'palabra', 'gu');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (85, 'palabra', 'sa');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (85, 'palabra', 'no');

/*Lección 18*/
INSERT INTO lecciones (id_nivel, titulo) VALUES (5, 'Lección 18: Sílabas con H');

/*Material para etapas, lección 18*/

/*Etapa 1: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (18, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (86, 'audio', 'assets/audio/lessons/lesson18/ha.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (86, 'palabra', 'ha');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (86, 'palabra', 'he');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (86, 'palabra', 'hi');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (86, 'palabra', 'ho');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (86, 'palabra', 'hu');

/*Etapa 2: beach*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (18, 'beach', 'assets/audio/VoiceHelp/LeccionPlaya.mp3', 'assets/Music/Beach.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (87, 'audio', 'assets/audio/lessons/lesson18/herrero.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (87, 'imagen', 'assets/images/lesson18/herrero.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (87, 'imagen', 'assets/images/lesson18/helado.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (87, 'imagen', 'assets/images/lesson18/hermano.png');

/*Etapa 3: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (18, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (88, 'imagen', 'assets/images/lesson18/higado.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (88, 'audio', 'assets/audio/lessons/lesson18/higado.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (88, 'palabra', 'hí');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (88, 'palabra', 'ga');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (88, 'palabra', 'do');

/*Etapa 4: sky*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (18, 'sky', 'assets/audio/VoiceHelp/LeccionCielo.mp3', 'assets/Music/Sky2.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (89, 'imagen', 'assets/images/lesson18/hormiga.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (89, 'audio', 'assets/audio/lessons/lesson18/hormiga.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (89, 'palabra', 'hormiga');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (89, 'imagen', 'assets/images/lesson18/hospital.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (89, 'audio', 'assets/audio/lessons/lesson18/hospital.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (89, 'palabra', 'hospital');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (89, 'imagen', 'assets/images/lesson18/hueso.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (89, 'audio', 'assets/audio/lessons/lesson18/hueso.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (89, 'palabra', 'hueso');

/*Etapa 5: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (18, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (90, 'imagen', 'assets/images/lesson18/huevo.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (90, 'audio', 'assets/audio/lessons/lesson18/huevo.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (90, 'palabra', 'hue');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (90, 'palabra', 'vo');

/*Lección 19*/
INSERT INTO lecciones (id_nivel, titulo) VALUES (5, 'Lección 19: Sílabas con Z');

/*Material para etapas, lección 19*/

/*Etapa 1: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (19, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (91, 'imagen', 'assets/images/lesson19/zapato.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (91, 'audio', 'assets/audio/lessons/lesson19/zapato.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (91, 'palabra', 'za');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (91, 'palabra', 'pa');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (91, 'palabra', 'to');

/*Etapa 2: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (19, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (92, 'audio', 'assets/audio/lessons/lesson19/ze.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (92, 'palabra', 'ze');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (92, 'palabra', 'za');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (92, 'palabra', 'zi');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (92, 'palabra', 'zo');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (92, 'palabra', 'zu');

/*Etapa 3: sky*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (19, 'sky', 'assets/audio/VoiceHelp/LeccionCielo.mp3', 'assets/Music/Sky2.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (93, 'imagen', 'assets/images/lesson19/zorro.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (93, 'audio', 'assets/audio/lessons/lesson19/zorro.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (93, 'palabra', 'zorro');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (93, 'imagen', 'assets/images/lesson19/zigzag.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (93, 'audio', 'assets/audio/lessons/lesson19/zigzag.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (93, 'palabra', 'zigzag');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (93, 'imagen', 'assets/images/lesson19/zanahoria.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (93, 'audio', 'assets/audio/lessons/lesson19/zanahoria.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (93, 'palabra', 'zanahoria');

/*Etapa 4: beach*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (19, 'beach', 'assets/audio/VoiceHelp/LeccionPlaya.mp3', 'assets/Music/Beach.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (94, 'audio', 'assets/audio/lessons/lesson19/zoologico.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (94, 'imagen', 'assets/images/lesson19/zoologico.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (94, 'imagen', 'assets/images/lesson19/zapato.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (94, 'imagen', 'assets/images/lesson19/zorro.png');

/*Etapa 5: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (19, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (95, 'audio', 'assets/audio/lessons/lesson19/zu.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (95, 'palabra', 'zu');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (95, 'palabra', 'za');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (95, 'palabra', 'ze');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (95, 'palabra', 'zi');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (95, 'palabra', 'zo');

/*Lección 20*/
INSERT INTO lecciones (id_nivel, titulo) VALUES (5, 'Lección 20: Sílabas con Y');

/*Material para etapas, lección 20*/

/*Etapa 1: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (20, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (96, 'audio', 'assets/audio/lessons/lesson20/ya.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (96, 'palabra', 'ya');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (96, 'palabra', 'ye');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (96, 'palabra', 'yi');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (96, 'palabra', 'yo');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (96, 'palabra', 'yu');

/*Etapa 2: beach*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (20, 'beach', 'assets/audio/VoiceHelp/LeccionPlaya.mp3', 'assets/Music/Beach.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (97, 'audio', 'assets/audio/lessons/lesson20/yate.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (97, 'imagen', 'assets/images/lesson20/yate.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (97, 'imagen', 'assets/images/lesson20/yogurt.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (97, 'imagen', 'assets/images/lesson20/yoyo.png');

/*Etapa 3: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (20, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (98, 'imagen', 'assets/images/lesson20/yegua.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (98, 'audio', 'assets/audio/lessons/lesson20/yegua.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (98, 'palabra', 'ye');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (98, 'palabra', 'gua');

/*Etapa 4: sky*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (20, 'sky', 'assets/audio/VoiceHelp/LeccionCielo.mp3', 'assets/Music/Sky2.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (99, 'imagen', 'assets/images/lesson20/yema.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (99, 'audio', 'assets/audio/lessons/lesson20/yema.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (99, 'palabra', 'yema');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (99, 'imagen', 'assets/images/lesson20/yerno.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (99, 'audio', 'assets/audio/lessons/lesson20/yerno.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (99, 'palabra', 'yerno');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (99, 'imagen', 'assets/images/lesson20/yunque.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (99, 'audio', 'assets/audio/lessons/lesson20/yunque.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (99, 'palabra', 'yunque');

/*Etapa 5: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (20, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (100, 'audio', 'assets/audio/lessons/lesson20/yu.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (100, 'palabra', 'yu');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (100, 'palabra', 'ya');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (100, 'palabra', 'ye');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (100, 'palabra', 'yi');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (100, 'palabra', 'yo');

/*Lección 21*/
INSERT INTO lecciones (id_nivel, titulo) VALUES (5, 'Lección 21: Sílabas con X');

/*Material para etapas, lección 21*/

/*Etapa 1: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (21, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (101, 'audio', 'assets/audio/lessons/lesson21/xa.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (101, 'palabra', 'xa');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (101, 'palabra', 'xe');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (101, 'palabra', 'xi');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (101, 'palabra', 'xo');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (101, 'palabra', 'xu');

/*Etapa 2: beach*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (21, 'beach', 'assets/audio/VoiceHelp/LeccionPlaya.mp3', 'assets/Music/Beach.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (102, 'audio', 'assets/audio/lessons/lesson21/xilofono.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (102, 'imagen', 'assets/images/lesson21/xilofono.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (102, 'imagen', 'assets/images/lesson21/boxeo.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (102, 'imagen', 'assets/images/lesson21/taxi.png');

/*Etapa 3: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (21, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (103, 'imagen', 'assets/images/lesson21/examen.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (103, 'audio', 'assets/audio/lessons/lesson21/examen.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (103, 'palabra', 'exa');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (103, 'palabra', 'men');

/*Etapa 4: sky*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (21, 'sky', 'assets/audio/VoiceHelp/LeccionCielo.mp3', 'assets/Music/Sky2.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (104, 'imagen', 'assets/images/lesson21/exito.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (104, 'audio', 'assets/audio/lessons/lesson21/exito.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (104, 'palabra', 'éxito');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (104, 'imagen', 'assets/images/lesson21/extraterrestre.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (104, 'audio', 'assets/audio/lessons/lesson21/extraterrestre.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (104, 'palabra', 'extraterrestre');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (104, 'imagen', 'assets/images/lesson21/explorador.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (104, 'audio', 'assets/audio/lessons/lesson21/explorador.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (104, 'palabra', 'explorador');

/*Etapa 5: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (21, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (105, 'audio', 'assets/audio/lessons/lesson21/xu.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (105, 'palabra', 'xu');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (105, 'palabra', 'xa');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (105, 'palabra', 'xe');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (105, 'palabra', 'xi');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (105, 'palabra', 'xo');

/*Nivel 6*/
INSERT INTO nivel (nombre) VALUES ('Nivel 6: Sílabas parte 5');

/*Lección 22*/
INSERT INTO lecciones (id_nivel, titulo) VALUES (6, 'Lección 22: Sílabas con K');

/*Material para etapas, lección 22*/

/*Etapa 1: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (22, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (106, 'audio', 'assets/audio/lessons/lesson22/ka.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (106, 'palabra', 'ka');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (106, 'palabra', 'ke');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (106, 'palabra', 'ki');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (106, 'palabra', 'ko');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (106, 'palabra', 'ku');

/*Etapa 2: beach*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (22, 'beach', 'assets/audio/VoiceHelp/LeccionPlaya.mp3', 'assets/Music/Beach.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (107, 'audio', 'assets/audio/lessons/lesson22/kilo.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (107, 'imagen', 'assets/images/lesson22/kilo.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (107, 'imagen', 'assets/images/lesson22/kanguro.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (107, 'imagen', 'assets/images/lesson22/ketchup.png');

/*Etapa 3: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (22, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (108, 'imagen', 'assets/images/lesson22/kilo.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (108, 'audio', 'assets/audio/lessons/lesson22/kilo.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (108, 'palabra', 'ki');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (108, 'palabra', 'lo');

/*Etapa 4: sky*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (22, 'sky', 'assets/audio/VoiceHelp/LeccionCielo.mp3', 'assets/Music/Sky2.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (109, 'imagen', 'assets/images/lesson22/kilo.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (109, 'audio', 'assets/audio/lessons/lesson22/kilo.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (109, 'palabra', 'kilo');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (109, 'imagen', 'assets/images/lesson22/kanguro.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (109, 'audio', 'assets/audio/lessons/lesson22/kanguro.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (109, 'palabra', 'kanguro');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (109, 'imagen', 'assets/images/lesson22/ketchup.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (109, 'audio', 'assets/audio/lessons/lesson22/ketchup.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (109, 'palabra', 'ketchup');

/*Etapa 5: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (22, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (110, 'audio', 'assets/audio/lessons/lesson22/ku.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (110, 'palabra', 'ku');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (110, 'palabra', 'ka');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (110, 'palabra', 'ke');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (110, 'palabra', 'ki');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (110, 'palabra', 'ko');

/*Lección 23*/
INSERT INTO lecciones (id_nivel, titulo) VALUES (6, 'Lección 23: Sílabas con W');

/*Material para etapas, lección 23*/

/*Etapa 1: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (23, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (111, 'audio', 'assets/audio/lessons/lesson23/wa.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (111, 'palabra', 'wa');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (111, 'palabra', 'we');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (111, 'palabra', 'wi');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (111, 'palabra', 'wo');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (111, 'palabra', 'wu');

/*Etapa 2: beach*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (23, 'beach', 'assets/audio/VoiceHelp/LeccionPlaya.mp3', 'assets/Music/Beach.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (112, 'audio', 'assets/audio/lessons/lesson23/wafle.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (112, 'imagen', 'assets/images/lesson23/wafle.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (112, 'imagen', 'assets/images/lesson23/waterpolo.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (112, 'imagen', 'assets/images/lesson23/wifi.png');

/*Etapa 3: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (23, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (113, 'imagen', 'assets/images/lesson23/waterpolo.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (113, 'audio', 'assets/audio/lessons/lesson23/waterpolo.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (113, 'palabra', 'wa');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (113, 'palabra', 'ter');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (113, 'palabra', 'polo');

/*Etapa 4: sky*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (23, 'sky', 'assets/audio/VoiceHelp/LeccionCielo.mp3', 'assets/Music/Sky2.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (114, 'imagen', 'assets/images/lesson23/wifi.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (114, 'audio', 'assets/audio/lessons/lesson23/wifi.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (114, 'palabra', 'wifi');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (114, 'imagen', 'assets/images/lesson23/wafle.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (114, 'audio', 'assets/audio/lessons/lesson23/wafle.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (114, 'palabra', 'wafle');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (114, 'imagen', 'assets/images/lesson23/waterpolo.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (114, 'audio', 'assets/audio/lessons/lesson23/waterpolo.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (114, 'palabra', 'waterpolo');

/*Etapa 5: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (23, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (115, 'audio', 'assets/audio/lessons/lesson23/wu.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (115, 'palabra', 'wu');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (115, 'palabra', 'wa');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (115, 'palabra', 'we');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (115, 'palabra', 'wi');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (115, 'palabra', 'wo');