from gtts import gTTS
import os

language = 'es-us'

# Determine the project root (assuming this script is located in a subdirectory of the project)
project_root = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', '..', '..'))

# Path to save audio files relative to the project root
audio_dir = os.path.join(project_root, 'assets', 'audio')

# Ensure the audio directory exists
os.makedirs(audio_dir, exist_ok=True)

# Function to convert a specific text to MP3
def convert_text_to_mp3(text):
    # Create a gTTS object
    tts = gTTS(text=text, lang=language, slow=False)

    # Save the audio as an .mp3 file in the specified directory
    tts.save(os.path.join(audio_dir, f"{text}.mp3"))
    print("Audio file saved successfully for:", text)

# Function to convert all text files in the "text" folder to MP3
def convert_all_text_files():
    # Assuming the 'text' directory is in the same location as the script
    script_dir = os.path.dirname(os.path.abspath(__file__))
    text_dir = os.path.join(script_dir, 'text')

    # Get the list of files in the "text" folder
    text_files = os.listdir(text_dir)

    for text_file in text_files:
        # Read the text file with proper encoding to handle accents
        with open(os.path.join(text_dir, text_file), 'r', encoding='utf-8') as file:
            text = file.read()

        # Remove the file extension from the text file name
        output_file = os.path.splitext(text_file)[0]

        # Create a gTTS object
        tts = gTTS(text=text, lang=language, slow=False)

        # Save the audio as an .mp3 file in the specified directory
        tts.save(os.path.join(audio_dir, f"{output_file}.mp3"))
        print("Audio file saved successfully for:", text_file)

def delete_audio_files():
    # Delete all audio files in the audio directory
    for file_name in os.listdir(audio_dir):
        file_path = os.path.join(audio_dir, file_name)
        if os.path.isfile(file_path) and file_name.endswith('.mp3'):
            os.remove(file_path)
    print("All audio files deleted successfully.")

# Prompt the user for their choice
choice = input("Enter: \n'1' to convert a specific text to MP3\n'2' to convert all text files\n'3' Delete all audio files\n:")

if choice == '1':
    text = input("Enter the text you want to convert to MP3: ")
    convert_text_to_mp3(text)
elif choice == '2':
    convert_all_text_files()
elif choice == '3':
    delete_audio_files()
else:
    print("Invalid choice. Please try again.")
