import json

PATH = '/userdata/Default/Preferences'

prefs = json.load(open(PATH, encoding='utf8'))
prefs.setdefault('download', {}).update(dict(
    default_directory='/downloads/',
    prompt_for_download=False
))
json.dump(prefs, open(PATH, 'w', encoding='utf8'))