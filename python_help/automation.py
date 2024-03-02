import os
import re
import os
import shutil
import pyautogui as py
from time import sleep


source_directory_FF = "K:\\Father Fourier Analysis Report\\Producer\\"
source_directory_MF = "K:\\Mother Fourier Analysis Report\\Producer\\"
destination_directory_FF = "K:\\Father Fourier Analysis Report\\"
destination_directory_MF = "K:\\Mother Fourier Analysis Report\\"

source_directory_FM = "K:\\\Father MRA Report\\Producer\\"
source_directory_MM = "K:\\Mother MRA Report\\Producer\\"
destination_directory_FM= "K:\\Father MRA Report\\"
destination_directory_MM = "K:\\Mother MRA Report\\"

file_to_move = "Frequency.xlsx"
file_name = "Frequency.xlsx"


def move_file(source_dir, destination_dir, ipfilename,opfilename):
    source_file = os.path.join(source_dir, ipfilename)
    destination_file = os.path.join(destination_dir, opfilename)

    try:
        shutil.move(source_file, destination_file)
    except Exception as e:
        print("")


sleep(10)

directory_path = "K:\\EEG\\Filtered_Data\\CSV"

files_list = os.listdir(directory_path)

# Regular expression pattern to find 'ex01' in file names
ex_type = [1,2,5,6,7,8,9,10]
for pat_maker in ex_type:
    if int(pat_maker) == 10:
        pattern = "_ex" + str(pat_maker)
    else:
        pattern = "_ex0" + str(pat_maker)
    

    # Filter files that contain 'ex01' in their names
    files = [file for file in files_list if re.search(pattern, file)]

    sleep(1)

    # Print the files containing 'ex01' in their names
    for file in files:
        full_path = directory_path + "\\" + file

        # Get the screen's resolution
        screen_width, screen_height = py.size()

        # Calculate the center of the screen
        center_x = screen_width // 2
        center_y = screen_height // 2

        # Move the mouse cursor to the center of the screen
        py.click(center_x, center_y)

        py.write(full_path)
        sleep(3)

        py.hotkey('ctrl', 'r')
        sleep(5)
    file_name = "Frequency" + pattern + "_Temporal" + ".xlsx"
    move_file(source_directory_FF, destination_directory_FF, file_to_move, file_name)
    move_file(source_directory_MF, destination_directory_MF, file_to_move,file_name)
    move_file(source_directory_FM, destination_directory_FM, file_to_move, file_name)
    move_file(source_directory_MM, destination_directory_MM, file_to_move,file_name)

