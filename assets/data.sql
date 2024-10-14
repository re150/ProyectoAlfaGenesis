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
VALUES (1, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/audio/Music/WaterLesson.mp3');

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
VALUES (1, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/audio/Music/WaterLesson.mp3');

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
VALUES (1, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/audio/Music/WaterLesson.mp3');

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
VALUES (1, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/audio/Music/WaterLesson.mp3');

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
VALUES (1, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/audio/Music/WaterLesson.mp3');

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

/*Material para etapas, lección 1*/

/*Etapa 1: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (2, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/audio/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (6, 'imagen', 'assets/images/lesson1/manzana.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (6, 'audio', 'assets/audio/lessons/lesson1/manzana.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (6, 'palabra', 'man');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (6, 'palabra', 'za');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (6, 'palabra', 'na');

/*Etapa 2: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (2, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/audio/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (7, 'audio', 'assets/audio/lessons/lesson1/mesa.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (7, 'palabra', 'mesa');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (7, 'palabra', 'masa');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (7, 'palabra', 'misa');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (7, 'palabra', 'mosa');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (7, 'palabra', 'musa');

/*Etapa 3: sky*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (2, 'sky', 'assets/audio/VoiceHelp/LeccionCielo.mp3', 'assets/audio/Music/Sky2.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (8, 'imagen', 'assets/images/lesson1/mirar.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (8, 'audio', 'assets/audio/lessons/lesson1/mirar.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (8, 'palabra', 'mirar');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (8, 'imagen', 'assets/images/lesson1/minar.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (8, 'audio', 'assets/audio/lessons/lesson1/minar.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (8, 'palabra', 'minar');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (8, 'imagen', 'assets/images/lesson1/miedo.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (8, 'audio', 'assets/audio/lessons/lesson1/miedo.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (8, 'palabra', 'miedo');

/*Etapa 4: beach*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (2, 'beach', 'assets/audio/VoiceHelp/LeccionPlaya.mp3', 'assets/audio/Music/Beach.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (9, 'audio', 'assets/audio/lessons/lesson1/monio.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (9, 'imagen', 'assets/images/lesson1/monio.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (9, 'imagen', 'assets/images/lesson1/mono.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (9, 'imagen', 'assets/images/lesson1/moto.jpg');

/*Etapa 5*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (2, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/audio/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (10, 'imagen', 'assets/images/lesson1/munieca.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (10, 'audio', 'assets/audio/lessons/lesson1/munieca.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (10, 'palabra', 'mu');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (10, 'palabra', 'ñe');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (10, 'palabra', 'ca');

