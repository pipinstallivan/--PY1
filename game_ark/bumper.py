import pygame

class Gun():

    def __init__(self, screen):
        # initalization of gun
        self.screen = screen
        self.image = pygame.image.load('img/bumper.png')
        self.rect = self.image.get_rect()
        self.screen_rect = screen.get_rect()
        self.rect.centerx = self.screen_rect.centerx
        self.rect.bottom = self.screen_rect.bottom
        self.move_right = False
        self.move_left = False
        self.center = float(self.rect.centerx)
    def draw(self):
        # drawing gun on screen
        self.screen.blit(self.image, self.rect)
    def update_unit(self):
        # обновление позиции бампера
        if self.move_right and self.rect.right < self.screen_rect.right:
            self.center += 0.25
        if self.move_left and self.rect.left > self.screen_rect.left:
            self.center -= 0.25
        self.rect.centerx = self.center