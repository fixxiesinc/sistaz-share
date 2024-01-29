import os
cmd = "flutter clean && flutter pub get && flutter build web --web-renderer html && firebase deploy --only hosting"
os.system(cmd)
