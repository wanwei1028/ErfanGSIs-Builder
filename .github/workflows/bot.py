import os
import pyrogram

with pyrogram.Client('bot', os.getenv('API_ID'), os.getenv('API_HASH'), bot_token=os.getenv('BOT_TOKEN')) as client:
        client.send_message(
            text=os.getenv('CAT_FILE'),
            chat_id=os.getenv('CHAT_ID'),
            parse_mode="markdown",
            disable_web_page_preview=True
        )