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

/*Lección 1*/
INSERT INTO lecciones (titulo) VALUES ('Lección 1: Vocales');

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

/*Lección 2*/
INSERT INTO lecciones (titulo) VALUES ('Lección 2: Sílabas con M');

/*Material para etapas, lección 2*/

/*Etapa 1: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (2, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (6, 'imagen', 'assets/images/lesson2/manzana.jpg');

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
VALUES (8, 'imagen', 'assets/images/lesson2/mirar.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (8, 'audio', 'assets/audio/lessons/lesson2/mirar.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (8, 'palabra', 'mirar');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (8, 'imagen', 'assets/images/lesson2/minar.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (8, 'audio', 'assets/audio/lessons/lesson2/minar.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (8, 'palabra', 'minar');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (8, 'imagen', 'assets/images/lesson2/miedo.jpg');

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
VALUES (9, 'imagen', 'assets/images/lesson2/monio.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (9, 'imagen', 'assets/images/lesson2/mono.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (9, 'imagen', 'assets/images/lesson2/moto.jpg');

/*Etapa 5*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (2, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (10, 'imagen', 'assets/images/lesson2/munieca.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (10, 'audio', 'assets/audio/lessons/lesson2/munieca.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (10, 'palabra', 'mu');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (10, 'palabra', 'ñe');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (10, 'palabra', 'ca');

/*Lección 3*/
INSERT INTO lecciones (titulo) VALUES ('Lección 3: Sílabas con S');

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
INSERT INTO lecciones (titulo) VALUES ('Lección 4: Sílabas con L');

/*Material para etapas, lección 4*/

/*Etapa 1: sky*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (4, 'sky', 'assets/audio/VoiceHelp/LeccionCielo.mp3', 'assets/Music/Sky2.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (16, 'imagen', 'assets/images/lesson1/lapiz.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (16, 'audio', 'assets/audio/lessons/lesson1/lapiz.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (16, 'palabra', 'lápiz');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (16, 'imagen', 'assets/images/lesson1/lago.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (16, 'audio', 'assets/audio/lessons/lesson1/lago.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (16, 'palabra', 'lago');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (16, 'imagen', 'assets/images/lesson1/ladrillo.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (16, 'audio', 'assets/audio/lessons/lesson1/ladrillo.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (16, 'palabra', 'ladrillo');

/*Etapa 2: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (4, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (17, 'imagen', 'assets/images/lesson1/leche.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (17, 'audio', 'assets/audio/lessons/lesson1/leche.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (17, 'palabra', 'le');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (17, 'palabra', 'che');

/*Etapa 3: beach*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (4, 'beach', 'assets/audio/VoiceHelp/LeccionPlaya.mp3', 'assets/Music/Beach.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (18, 'audio', 'assets/audio/lessons/lesson1/libro.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (18, 'imagen', 'assets/images/lesson1/libro.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (18, 'imagen', 'assets/images/lesson1/limpiar.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (18, 'imagen', 'assets/images/lesson1/lima.jpg');

/*Etapa 4: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (4, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (19, 'audio', 'assets/audio/lessons/lesson1/lo.mp3');

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
VALUES (20, 'imagen', 'assets/images/lesson1/luna.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (20, 'audio', 'assets/audio/lessons/lesson1/luna.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (20, 'palabra', 'lu');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (20, 'palabra', 'na');

/*Lección 5*/
INSERT INTO lecciones (titulo) VALUES ('Lección 5: Sílabas con T');

/*Material para etapas, lección 5*/

/*Etapa 1: beach*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (5, 'beach', 'assets/audio/VoiceHelp/LeccionPlaya.mp3', 'assets/Music/Beach.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (21, 'audio', 'assets/audio/lessons/lesson1/taza.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (21, 'imagen', 'assets/images/lesson1/taza.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (21, 'imagen', 'assets/images/lesson1/taco.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (21, 'imagen', 'assets/images/lesson1/tarea.png');

/*Etapa 2: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (5, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (22, 'imagen', 'assets/images/lesson1/tenedor.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (22, 'audio', 'assets/audio/lessons/lesson1/tenedor.mp3');

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
VALUES (23, 'imagen', 'assets/images/lesson1/tigre.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (23, 'audio', 'assets/audio/lessons/lesson1/tigre.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (23, 'palabra', 'tigre');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (23, 'imagen', 'assets/images/lesson1/tienda.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (23, 'audio', 'assets/audio/lessons/lesson1/tienda.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (23, 'palabra', 'tienda');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (23, 'imagen', 'assets/images/lesson1/tijeras.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (23, 'audio', 'assets/audio/lessons/lesson1/tijeras.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (23, 'palabra', 'tijeras');

/*Etapa 4: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (5, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (24, 'audio', 'assets/audio/lessons/lesson1/to.mp3');

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
VALUES (25, 'audio', 'assets/audio/lessons/lesson1/tumba.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (25, 'imagen', 'assets/images/lesson1/tumba.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (25, 'imagen', 'assets/images/lesson1/turista.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (25, 'imagen', 'assets/images/lesson1/tucan.png');