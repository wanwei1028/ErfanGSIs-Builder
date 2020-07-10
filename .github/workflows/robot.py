# Thanks to github.com/usernein

import os
import pyrogram

with open('Aonly.txt') as f:
    os.environ['CAT_FILE'] = f.read()

rom = os.getenv('ROM_NAME')
cat = os.getenv('CAT_FILE')
da = os.getenv('DOWNLOAD_A')
dab = os.getenv('DOWNLOAD_AB')

with pyrogram.Client('bot', os.getenv('API_ID'), os.getenv('API_HASH'), bot_token=os.getenv('BOT_TOKEN')) as client:
    client.send_message(
        text=f"""<b>{rom} GSI For A/AB Devices</b>

<b>Information:</b>
<code>{cat}</code>
        
<b>Download A-Only:</b> <a href="{da}">HERE</a>
<b>Download A/B:</b> <a href="{dab}">HERE</a>

<a href="https://github.com/erfanoabdi/ErfanGSIs">Ported using ErfanGSIs Tool</a>""",
        chat_id=os.getenv('CHAT_ID'),
        parse_mode="html",
        disable_web_page_preview=True
    )
