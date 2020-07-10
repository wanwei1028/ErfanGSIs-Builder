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
        text=f"""*{rom} GSI For A/AB Devices*

        {cat}

        {da} // {dab}""",
        chat_id=os.getenv('CHAT_ID'),
        parse_mode="markdown",
        disable_web_page_preview=True
    )
