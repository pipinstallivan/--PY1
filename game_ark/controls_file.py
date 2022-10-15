import pygame
import sys

def sniff_events(bumper):
    # обработка событий
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit()
            sys.exit()
        elif event.type == pygame.KEYDOWN:
            if event.key == pygame.K_d:  # нажатие кнопки вправо
                bumper.move_right = True
            if event.key == pygame.K_a:  # нажатие кнопки влево
                bumper.move_left = True
        elif event.type == pygame.KEYUP:
            if event.key == pygame.K_d:  # отжатие кнопки влево
                bumper.move_right = False
            if event.key == pygame.K_a:  # отжатие кнопки влево
                bumper.move_left = False

