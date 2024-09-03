from gtts import gTTS
import os

language = 'es-us'

# Determine the project root (assuming this script is located in a subdirectory of the project)
project_root = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', '..', '..'))

# Path to save audio files relative to the project root
audio_dir = os.path.join(project_root, 'assets', 'audio')

text_dir = os.path.join(project_root, 'lib', 'features', 'data', 'audios-generator', 'text')

# Ensure the audio directory exists
os.makedirs(audio_dir, exist_ok=True)

# Function to convert a specific text to MP3
def convert_text_to_mp3(text):
    # Create a gTTS object
    tts = gTTS(text=text, lang=language, slow=False)

    # Save the audio as an .mp3 file in the specified directory
    tts.save(os.path.join(audio_dir, f"{text}.mp3"))
    print("Audio file saved successfully for:", text)

def convert_all_text_files():
    # Initialize an empty list to store the paths of all text files
    text_files = []

    # Recursively traverse all subdirectories of the text directory
    for root, dirs, files in os.walk(text_dir):
        # Iterate over each file in the current directory
        for file in files:
            # Check if the file has a .txt extension
            if file.endswith('.txt'):
                # Construct the full path of the text file
                file_path = os.path.join(root, file)
                # Append the file path to the list
                text_files.append(file_path)

    print(text_files)
    
    # Convert each text file to MP3 and save it in the audio directory
    for file_path in text_files:
        # Get the relative path of the text file
        relative_path = os.path.relpath(file_path, text_dir)
        print("Relative path:", file_path)
        # Construct the destination path in the audio directory
        destination_path = os.path.join(audio_dir, relative_path)
        # Change the file extension to .mp3
        destination_path = os.path.splitext(destination_path)[0] + '.mp3'
        # Create the directory structure if it doesn't exist
        os.makedirs(os.path.dirname(destination_path), exist_ok=True)
        # Convert the text file to MP3 and save it in the destination path
        convert_text_to_mp3(file_path, destination_path)
        print("MP3 file created successfully for:", file_path)

def convert_text_to_mp3(source_path, destination_path):
    # Read the text from the source file
    with open(source_path, 'r', encoding='utf-8') as file:
        text = file.read()

    # Create a gTTS object
    tts = gTTS(text=text, lang=language, slow=False)

    # Save the audio as an .mp3 file in the specified directory
    tts.save(destination_path)

# Check if the audio directory exists and create it if it doesn't
if not os.path.exists(audio_dir):
    os.makedirs(audio_dir)

# Call the function to convert all text files to MP3
convert_all_text_files()
