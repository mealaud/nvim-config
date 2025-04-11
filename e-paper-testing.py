#!/usr/bin/python
# -*- coding:utf-8 -*-
import sys
import os
picdir = os.path.join(os.path.dirname(os.path.dirname(os.path.realpath(__file__))), 'pic')
libdir = os.path.join(os.path.dirname(os.path.dirname(os.path.realpath(__file__))), 'lib')
if os.path.exists(libdir):
    sys.path.append(libdir)

import logging
from waveshare_epd import epd4in2_V2
import time
from PIL import Image,ImageDraw,ImageFont
import traceback

logging.basicConfig(level=logging.DEBUG)

try:
    logging.info("epd4in2 Demo")
    
    epd = epd4in2_V2.EPD()
    logging.info("init and Clear")
    epd.init()
    epd.Clear()
    
    # font24 = ImageFont.truetype(os.path.join(picdir, 'Font.ttc'), 24)
    # font18 = ImageFont.truetype(os.path.join(picdir, 'Font.ttc'), 18)
    font35 = ImageFont.truetype(os.path.join(picdir, 'Font.ttc'), 35)
    

    logging.info("Attempting to include sprite on screen.")
    # 255 code clears image so we start with something blank. 
    # "1" makes it so its either black or white pixels, which is good for our test.
    with Image.new("L", (epd.width, epd.height), 255) as sprite_canvas:   
        sprite_canvas.paste(Image.open("sprite.bmp"), (0,0))  # Adding image to canvas
        draw = ImageDraw.Draw(sprite_canvas)
        draw.text((0,0), "monty", font=font35, fill=epd.GRAY2)
        draw.text((50,70), "im gonna skin u", font=font35, fill=epd.GRAY2)
        epd.display_Fast(epd.getbuffer(sprite_canvas))  # Displaying image by loading into buffer
        time.sleep(5)  # Let it sit there for a bit.

    logging.info("Clearing screen and prepping to shut off.")
    epd.init()
    epd.Clear()
    logging.info("Sleep little one.")
    epd.sleep()
    
except IOError as e:
    logging.info(e)
    
except KeyboardInterrupt:    
    logging.info("ctrl + c:")
    epd4in2_V2.epdconfig.module_exit(cleanup=True)
    exit()
