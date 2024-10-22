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
VALUES (16, 'imagen', 'assets/images/lesson4/lapiz.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (16, 'audio', 'assets/audio/lessons/lesson4/lapiz.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (16, 'palabra', 'lápiz');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (16, 'imagen', 'assets/images/lesson4/lago.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (16, 'audio', 'assets/audio/lessons/lesson4/lago.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (16, 'palabra', 'lago');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (16, 'imagen', 'assets/images/lesson4/ladrillo.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (16, 'audio', 'assets/audio/lessons/lesson4/ladrillo.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (16, 'palabra', 'ladrillo');

/*Etapa 2: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (4, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (17, 'imagen', 'assets/images/lesson4/leche.jpg');

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
VALUES (18, 'imagen', 'assets/images/lesson4/limpiar.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (18, 'imagen', 'assets/images/lesson4/lima.jpg');

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
INSERT INTO lecciones (titulo) VALUES ('Lección 5: Sílabas con T');

/*Material para etapas, lección 5*/

/*Etapa 1: beach*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (5, 'beach', 'assets/audio/VoiceHelp/LeccionPlaya.mp3', 'assets/Music/Beach.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (21, 'audio', 'assets/audio/lessons/lesson5/taza.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (21, 'imagen', 'assets/images/lesson5/taza.jpg');

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
VALUES (23, 'imagen', 'assets/images/lesson5/tienda.jpg');

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
VALUES (25, 'imagen', 'assets/images/lesson5/turista.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (25, 'imagen', 'assets/images/lesson5/tucan.png');

/*Lección 6*/
INSERT INTO lecciones (titulo) VALUES ('Lección 6: Sílabas con P');

/*Material para etapas, lección 6*/

/*Etapa 1: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (6, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (26, 'imagen', 'assets/images/lesson6/pato.jpg');

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
VALUES (27, 'imagen', 'assets/images/lesson6/pez.jpg');

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
VALUES (29, 'imagen', 'assets/images/lesson6/pozo.jpg');

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

/*Lección 7*/
INSERT INTO lecciones (titulo) VALUES ('Lección 7: Sílabas con R');

/*Material para etapas, lección 7*/

/*Etapa 1: beach*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (7, 'beach', 'assets/audio/VoiceHelp/LeccionPlaya.mp3', 'assets/Music/Beach.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (31, 'audio', 'assets/audio/lessons/lesson7/raton.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (31, 'imagen', 'assets/images/lesson7/raton.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (31, 'imagen', 'assets/images/lesson7/rana.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (31, 'imagen', 'assets/images/lesson7/radio.png');

/*Etapa 2: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (7, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (32, 'imagen', 'assets/images/lesson7/regalo.jpg');

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
VALUES (33, 'imagen', 'assets/images/lesson7/rodilla.jpg');

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
VALUES (35, 'imagen', 'assets/images/lesson7/rueda.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (35, 'imagen', 'assets/images/lesson7/rubio.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (35, 'imagen', 'assets/images/lesson7/ruido.png');

/*Lección 8*/
INSERT INTO lecciones (titulo) VALUES ('Lección 8: Sílabas con N');

/*Material para etapas, lección 8*/

/*Etapa 1: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (8, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (36, 'imagen', 'assets/images/lesson8/naranja.jpg');

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
VALUES (38, 'imagen', 'assets/images/lesson8/nido.jpg');

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
VALUES (39, 'imagen', 'assets/images/lesson8/noche.jpg');

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
VALUES (40, 'imagen', 'assets/images/lesson8/nube.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (40, 'imagen', 'assets/images/lesson8/nutria.png');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (40, 'imagen', 'assets/images/lesson8/nuez.png');

/*Lección 9*/
INSERT INTO lecciones (titulo) VALUES ('Lección 9: Sílabas con C');

/*Material para etapas, lección 9*/

/*Etapa 1: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (9, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (41, 'imagen', 'assets/images/lesson9/casa.jpg');

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
VALUES (42, 'imagen', 'assets/images/lesson9/cena.jpg');

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
VALUES (44, 'imagen', 'assets/images/lesson9/conejo.jpg');

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
INSERT INTO lecciones (titulo) VALUES ('Lección 10: Sílabas con Q');

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
VALUES (47, 'imagen', 'assets/images/lesson10/queja.jpg');

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
VALUES (48, 'imagen', 'assets/images/lesson10/quince.jpg');

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
VALUES (49, 'imagen', 'assets/images/lesson10/quedarse.jpg');

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