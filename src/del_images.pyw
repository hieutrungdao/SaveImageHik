import os

while True:
    list_of_files = os.listdir('image')
    full_path = ["image/{0}".format(x) for x in list_of_files]
    if len(list_of_files) > 5:
        oldest_file = min(full_path, key=os.path.getmtime)
        print(oldest_file)
        os.remove(oldest_file)
