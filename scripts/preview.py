import os
cmd = "flutter clean && flutter pub get && flutter build web --web-renderer html && firebase hosting:channel:deploy preview"
os.system(cmd)
