use vk;

ALTER TABLE `profiles` ADD CONSTRAINT fk_prof_id
    FOREIGN KEY (photo_id) REFERENCES photos(id)
    ON UPDATE CASCADE 
    ON DELETE RESTRICT; 

ALTER TABLE `likes` ADD CONSTRAINT lk_media_id
    FOREIGN KEY (media_id) REFERENCES media(id)
    ON UPDATE CASCADE 
    ON DELETE RESTRICT;    
       
commit;
