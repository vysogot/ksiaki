select u.uid
, u.name as nick
, u.mail
, IFNULL(i.field_imie_value,'') as imie
, IFNULL(n.field_nazwisko_value,'') as nazwisko
, CONCAT(SUBSTRING(f.filename,1,7),'-',u.name,'.',SUBSTRING_INDEX(f.filename,'.',-1)) as avatar
, FROM_UNIXTIME(created) AS created


, f.filename



, CASE WHEN (pl.field_plec_value = 'M') THEN 1 ELSE 2 END as gender
, DATE_FORMAT(ur.field_data_urodzenia_value,'%Y-%m-%d') as data_urodzenia
, IFNULL(adr.field_adres_thoroughfare,'') as adress
, IFNULL(adr.field_adres_postal_code,'') as postcode
, IFNULL(adr.field_adres_locality,'') as city

, IFNULL(ir.field_imie_rodzica_value,'') as rodzic_imie
, IFNULL(nr.field_nazwisko_rodzica_value,'') as rodzic_nazwisko
, IFNULL(rd.field_email_rodzica_email,'') as rodzic_email

, pl.field_plec_value
, FROM_UNIXTIME(u.login) as last_login
, u.status as status
from users as u
left join file_managed as f on (u.picture = f.fid)
left join field_data_field_data_urodzenia AS ur ON (u.uid = ur.entity_id)
left join field_data_field_plec as pl on (u.uid = pl.entity_id)
left join field_data_field_imie as i on (u.uid = i.entity_id) and (i.deleted = 0)
left join field_data_field_nazwisko as n on (u.uid = n.entity_id) and (n.deleted = 0)
left join field_revision_field_email_rodzica as rd on (u.uid = rd.entity_id) and (rd.deleted = 0)
left join field_data_field_imie_rodzica as ir on (u.uid = ir.entity_id) and (ir.deleted = 0)
left join field_data_field_nazwisko_rodzica as nr on (u.uid = nr.entity_id) and (nr.deleted = 0)
left join field_data_field_adres as adr on (u.uid = adr.entity_id) and (adr.deleted = 0)
WHERE (u.uid > 0);