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
INSERT INTO lecciones (titulo) VALUES ('Lección 1: Sílabas con M');

/*Material para etapas, lección 1*/

/*Etapa 1: blocks*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (1, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/audio/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (1, 'imagen', 'assets/images/lesson1/manzana.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (1, 'audio', 'assets/audio/lessons/lesson1/manzana.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (1, 'palabra', 'man');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (1, 'palabra', 'za');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (1, 'palabra', 'na');

/*Etapa 2: bubbles*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (1, 'bubbles', 'assets/audio/VoiceHelp/LeccionBurbujas.mp3', 'assets/audio/Music/WaterLesson.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (2, 'audio', 'assets/audio/lessons/lesson1/mesa.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (2, 'palabra', 'me');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (2, 'palabra', 'sa');

/*Etapa 3: sky*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (1, 'sky', 'assets/audio/VoiceHelp/LeccionCielo.mp3', 'assets/audio/Music/Sky2.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (3, 'imagen', 'assets/images/lesson1/mirar.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (3, 'audio', 'assets/audio/lessons/lesson1/mirar.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (3, 'palabra', 'mirar');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (3, 'imagen', 'assets/images/lesson1/minar.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (3, 'audio', 'assets/audio/lessons/lesson1/minar.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (3, 'palabra', 'minar');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (3, 'imagen', 'assets/images/lesson1/miedo.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (3, 'audio', 'assets/audio/lessons/lesson1/miedo.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (3, 'palabra', 'miedo');

/*Etapa 4: beach*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (1, 'beach', 'assets/audio/VoiceHelp/LeccionPlaya.mp3', 'assets/audio/Music/Beach.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (4, 'audio', 'assets/audio/lessons/lesson1/monio.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (4, 'imagen', 'assets/images/lesson1/monio.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (4, 'imagen', 'assets/images/lesson1/mono.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (4, 'imagen', 'assets/images/lesson1/moto.jpg');

/*Etapa 5*/

INSERT INTO etapa (id_leccion, leccion_tipo, instrucciones, musica_fondo)
VALUES (1, 'blocks', 'assets/audio/VoiceHelp/LeccionBloques.mp3', 'assets/audio/Music/Blocks.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (5, 'imagen', 'assets/images/lesson1/munieca.jpg');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (5, 'audio', 'assets/audio/lessons/lesson1/munieca.mp3');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (5, 'palabra', 'mu');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (5, 'palabra', 'ñe');

INSERT INTO material (id_etapa, tipo_material, valor_material)
VALUES (5, 'palabra', 'ca');

