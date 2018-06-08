SET FOREIGN_KEY_CHECKS = 0;
SET NAMES utf8;

TRUNCATE TABLE `def_games`;
INSERT INTO `def_games` (`id`, `name`, `description`)
VALUES
(1, 'sorcerer', 'game_sorcerer_description'),
(2, 'pacman', 'game_pacman_description');

TRUNCATE TABLE `def_contest_types`;
INSERT INTO `def_contest_types` (`id`, `name`)
VALUES
(1, 'Normalny'),
(2, 'Specjalny');

TRUNCATE TABLE `def_contest_places`;
INSERT INTO `def_contest_places` (`id`, `contest_type_id`, `name`, `place`, `points`)
VALUES
(1, 1, 'contest_places_1st_place', 1, 100),
(2, 1, 'contest_places_2nd_place', 2, 99),
(3, 2, 'contest_places_1st_place', 1, 200),
(4, 2, 'contest_places_2nd_place', 2, 199);

TRUNCATE TABLE `def_pointed_activities`;
INSERT INTO `def_pointed_activities` (`id`, `name`, `points`)
VALUES
(1, 'registration', 5),
(2, 'login', 1),
(3, 'invitation_login', 5),
(4, 'contest_participation', 5),
(5, 'personal_best_score_update', 1);

TRUNCATE TABLE `def_badges`;
INSERT INTO `def_badges` (`id`, `title`, `subtitle`, `description`, `image_url`)
VALUES
(1, 'badge_champion_title', 'badge_champion_subtitle', 'badge_champion_description', '/uploads/badges/champion.png'),
(2, 'badge_fighter_title', 'badge_fighter_subtitle', 'badge_fighter_description', '/uploads/badges/fighter.png'),
(3, 'badge_fan_title', 'badge_fan_subtitle', 'badge_fan_description', '/uploads/badges/fan.png'),
(4, 'badge_friend_title', 'badge_friend_subtitle', 'badge_friend_description', '/uploads/badges/friend.png'),
(5, 'badge_gamer_title', 'badge_gamer_subtitle', 'badge_gamer_description', '/uploads/badges/gamer.png');

TRUNCATE TABLE `def_ranks`;
INSERT INTO `def_ranks` (`id`, `title`, `points_threshold`, `image_url`)
VALUES
(1, 'rank_player', 5, '/uploads/ranks/player.png'),
(2, 'rank_star_player', 500, '/uploads/ranks/star-player.png'),
(3, 'rank_top_player', 1000, '/uploads/ranks/top-player.png'),
(4, 'rank_konkursiak', 5000, '/uploads/ranks/konkursiak.png');

TRUNCATE TABLE `_users`;
/* password: 12345678 */
INSERT INTO `_users` (`id`, `role_id`, `nick`, `name`, `surname`, `email`, `password_hash`, `is_active`) VALUES
	(1, 2,  'user', 'Piotr', 'Gracz',  'demo@demo.com', 	'$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', 1),
	(2, 1,  'admin', 'Tomasz', 'Admin', 'demo2@demo.com', 	'$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', 1),
	(3, 2,  'basia99', 'Basia', 'Grymas', 'basia@demo.com', 	'$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', 1),
	(4, 2,  'sta13', 'Stasia', 'Hejsiup', 'stasia@demo.com', '$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', 1),
	(5, 2,  'kkmaster', 'Krzyś', 'Kowal', 'krzys@demo.com', 	'$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', 1),
	(6, 2,  'grzechu', 'Grześ', 'Stawo', 'grzes@demo.com',	'$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', 1),
	(7, 2,  'tomo', 'Tomek', 'Dynda', 'tomek@demo.com',	'$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', 1),
	(8, 2,  'banzai11', 'Jasia', 'Dżem', 'jasia@demo.com',  '$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', 1),
	(9, 2,  'zuzu', 'Zuzia', 'Kapusta', 'zuzia@demo.com',  '$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', 1),
	(10, 2, 'aaaappp11', 'Adam', 'Ginger', 'adam@demo.com',   '$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', 1),
	(11, 2, 'vysogot', 'Jakub', 'Godawa', 'jakub.godawa@gmail.com',   '$2y$10$EwF6/cRU8hVn8b7j.WswyeLmie6oYOI83ljS3WvWW9uu4GOzevOOy', 1);

TRUNCATE TABLE `_backgrounds`;
INSERT INTO `_backgrounds` (`id`, `name`, `image_url`, `link_url`, `background_color`, `details_color`, `is_active`, `begins_at`, `ends_at`, `created_at`, `updated_at`)
VALUES
(1, 'Mleczna droga', '/uploads/backgrounds/background-1.jpg', 'http://onet.pl', '#fff', '#000', 1, '2018-01-31 00:00:00', '2028-09-30 00:00:00', '2008-09-30 00:00:00', '2009-09-30 00:00:00'),
(2, 'Jaskiniowiec', '/uploads/backgrounds/background-2.jpg', 'http://wp.pl', 'black', 'white', 0, '2018-09-30 00:00:00', '2019-09-30 00:00:00', '2006-09-30 00:00:00', '2008-09-30 00:00:00');

TRUNCATE TABLE `_slides`;
INSERT INTO `_slides` (`id`, `name`, `image_url`, `link_url`, `is_active`, `begins_at`, `ends_at`)
VALUES
(1, 'Slajd 1', '/uploads/slides/slide-1.jpg', 'http://konkursiaki.pl', 1, '2018-02-02 00:00:00', '2018-09-20 00:00:00'),
(2, 'Slajd 2', '/uploads/slides/slide-2.jpg', 'http://konkursiaki.pl', 1, '2028-02-02 00:00:00', '2028-09-20 00:00:00'),
(3, 'Slajd 3', '/uploads/slides/slide-3.jpg', 'http://konkursiaki.pl', 1, '2038-02-02 00:00:00', '2038-09-20 00:00:00');

TRUNCATE TABLE `_user_movies`;
INSERT INTO `_user_movies` (`id`, `user_id`, `name`, `description`, `video_url`, `image_url`, `link_url`, `is_active`, `begins_at`, `ends_at`)
VALUES
(1, 1, 'User video 1', 'description', '/uploads/user_movies/user_movies/movie-1.mov', '/uploads/user_movie-1.jpg', 'http://konkursiaki.pl', 1, '2018-02-02 00:00:00', '2018-02-20 00:00:00'),
(2, 2, 'User video 2', 'description', '/uploads/user_movies/user_movies/movie-2.mov', '/uploads/user_movie-2.jpg', 'http://konkursiaki.pl', 1, '2018-02-02 00:00:00', '2018-02-20 00:00:00'),
(3, 2, 'User video 3', 'description', '/uploads/user_movies/user_movies/movie-1.mov', '/uploads/user_movie-3.jpg', 'http://konkursiaki.pl', 1, '2018-02-02 00:00:00', '2018-02-20 00:00:00'),
(4, 1, 'User video 4', 'description', '/uploads/user_movies/user_movies/movie-1.mov', '/uploads/user_movie-4.jpg', 'http://konkursiaki.pl', 1, '2018-02-02 00:00:00', '2018-02-20 00:00:00'),
(5, 2, 'User video 5', 'description', '/uploads/user_movies/user_movies/movie-1.mov', '/uploads/user_movie-3.jpg', 'http://konkursiaki.pl', 1, '2018-02-02 00:00:00', '2018-02-20 00:00:00'),
(6, 1, 'User video 6', 'description', '/uploads/user_movies/user_movies/movie-2.mov', '/uploads/user_movie-2.jpg', 'http://konkursiaki.pl', 1, '2018-02-02 00:00:00', '2018-02-20 00:00:00');

TRUNCATE TABLE `_user_movies_likes`;
INSERT INTO `_user_movies_likes` (`user_id`, `user_movie_id`)
VALUES (1, 4), (2, 4), (1, 3), (2, 1);

TRUNCATE TABLE `_video_ads`;
INSERT INTO `_video_ads` (`id`, `name`, `video_url`, `image_url`, `link_url`, `is_active`, `begins_at`, `ends_at`)
VALUES
(1, 'Video ad 1', '/uploads/videos/movie-1.mov', '/uploads/videos/movie-cta.jpg', 'http://konkursiaki.pl', 1, '2018-02-02 00:00:00', '2018-02-20 00:00:00'),
(2, 'Video ad 2', '/uploads/videos/movie-2.mov', '/uploads/videos/movie-cta.jpg', 'http://konkursiaki.pl', 1, '2018-02-02 00:00:00', '2018-02-20 00:00:00');

TRUNCATE TABLE `_boxes`;
INSERT INTO `_boxes` (`id`, `name`, `image_url`, `link_url`, `is_active`, `begins_at`, `ends_at`, `created_at`, `updated_at`)
VALUES
(1, 'Pierwszy box', '/uploads/boxes/box-1.jpg', 'http://onet.pl', 1, '2018-01-31 00:00:00', '2028-09-30 00:00:00', '2008-09-30 00:00:00', '2009-09-30 00:00:00'),
(2, 'Drugi box', '/uploads/boxes/box-2.jpg', 'http://wp.pl', 1, '2018-09-30 00:00:00', '2019-09-30 00:00:00', '2006-09-30 00:00:00', '2008-09-30 00:00:00'),
(3, 'Trzeci box', '/uploads/boxes/box-3.jpg', 'http://wp.pl', 1, '2018-09-30 00:00:00', '2019-09-30 00:00:00', '2006-09-30 00:00:00', '2008-09-30 00:00:00'),
(4, 'Czwarty box', '/uploads/boxes/box-4.jpg', 'http://wp.pl', 1, '2018-09-30 00:00:00', '2019-09-30 00:00:00', '2006-09-30 00:00:00', '2008-09-30 00:00:00'),
(5, 'Piąty box', '/uploads/boxes/box-3.jpg', 'http://wp.pl', 1, '2018-09-30 00:00:00', '2019-09-30 00:00:00', '2006-09-30 00:00:00', '2008-09-30 00:00:00'),
(6, 'Szósty box', '/uploads/boxes/box-2.jpg', 'http://wp.pl', 1, '2018-09-30 00:00:00', '2019-09-30 00:00:00', '2006-09-30 00:00:00', '2008-09-30 00:00:00');

TRUNCATE TABLE `_contests`;
INSERT INTO `_contests` (`id`, `game_id`, `contest_type_id`, `name`, `description`, `box_url`, `header_url`, `begins_at`, `ends_at`, `display_ad`)
VALUES
(1, 1, 2, 'Jaskiniowiec', 'Niesamowity konkurs!', '/uploads/contests/box-1.jpg', '/uploads/contests/contest-banner.jpg', '2018-01-31 00:00:00', '2018-02-28 00:00:00', 0),
(2, 2, 1, 'Ptaszki i pieski', 'Nowe nagrody!', '/uploads/contests/box-2.jpg', '/uploads/contests/contest-banner.jpg', '2018-01-31 00:00:00', '2018-02-28 00:00:00', 0),
(3, 1, 2, 'Mistrz Pola', 'Zgarnij klocki LEGO!', '/uploads/contests/box-3.jpg', '/uploads/contests/contest-banner.jpg', '2018-01-31 00:00:00', '2018-02-28 00:00:00', 0),
(4, 2, 1, 'Faraon Kontratakuje', 'Szał piórników!', '/uploads/contests/box-4.jpg', '/uploads/contests/contest-banner.jpg', '2018-01-31 00:00:00', '2018-02-28 00:00:00', 0),
(5, 1, 2, 'Kulki Fulki', 'Ekstra zabawa!', '/uploads/contests/box-2.jpg', '/uploads/contests/contest-banner.jpg', '2018-01-31 00:00:00', '2018-02-28 00:00:00', 0),
(6, 2, 1, 'Paramemnon', 'Moc!', '/uploads/contests/box-1.jpg', '/uploads/contests/contest-banner.jpg', '2018-01-31 00:00:00', '2018-02-28 00:00:00', 0);

TRUNCATE TABLE `_notifications`;
INSERT INTO `_notifications` (`id`, `title`, `content`)
VALUES
(1, 'notification_title_password_restart', 'notification_content_password_restart'),
(2, 'notification_title_new_game', 'notification_content_new_game');

TRUNCATE TABLE `_notification_statuses`;
INSERT INTO `_notification_statuses` (`id`, `notification_id`, `user_id`, `confirmed_at`)
VALUES
(1, 1, 1, '2018-01-31 00:00:00'),
(2, 1, 2, '2018-02-12 00:00:00');

TRUNCATE TABLE `_heroes`;
INSERT INTO `_heroes` (`id`, `name`, `slug`, `description`, `avatar_url`, `header_url`, `cover_url`, `video_url`, `gadget_url`, `footer_url`, `license_description`, `is_active`, `created_at`, `updated_at`)
VALUES
(1, 'Scooby Doo', 'scooby-doo', 'Tajemnicza Spółka musi zmierzyć się z dinozaurami, które zakłócają spokój mieszkańcom Dreszczykowa. Ale przecież nie tylko Velma wie, że te prehistoryczne gady wyginęły dawno temu… Ktoś się, zatem pod nie podszywa! W jakim celu? To już musisz wyjaśnić wspólnie z detektywami!', '/uploads/heroes/heroes-1-avatar.jpg', '/uploads/heroes/heroes-1-header.jpg', '/uploads/heroes/heroes-1-cover.jpg', '/uploads/heroes/movie-1.mov', '/uploads/heroes/heroes-1-gadget.png', '/uploads/heroes/heroes-1-footer.jpg', 'Opis licencji na Scooby Doo 2018', TRUE, '2018-01-31 00:00:00', '2018-01-31 00:00:00');

INSERT INTO `_heroes` (`id`, `name`, `slug`, `description`, `avatar_url`, `header_url`, `is_active`, `created_at`, `updated_at`)
VALUES
(2, 'LEGO Ninjago', 'lego-ninjago', 'Opis LEGO Ninjago', '/uploads/heroes/heroes-2-avatar.jpg', '/uploads/heroes/heroes-2-header.jpg', TRUE, '2018-01-31 00:00:00', '2018-01-31 00:00:00'),
(3, 'LEGO Batman', 'lego-batman', 'Opis LEGO Batmana', '/uploads/heroes/heroes-3-avatar.jpg', '/uploads/heroes/heroes-3-header.jpg', TRUE, '2018-01-31 00:00:00', '2018-01-31 00:00:00'),
(4, 'Dragons', 'dragons', 'Opis Dragons', '/uploads/heroes/heroes-4-avatar.jpg', '/uploads/heroes/heroes-4-header.jpg', TRUE, '2018-01-31 00:00:00', '2018-01-31 00:00:00'),
(5, 'LEGO Elves', 'lego-elves', 'Opis LEGO Elves', '/uploads/heroes/heroes-5-avatar.jpg', '/uploads/heroes/heroes-5-header.jpg', TRUE, '2018-01-31 00:00:00', '2018-01-31 00:00:00'),
(6, 'LEGO City', 'lego-city', 'Opis LEGO City', '/uploads/heroes/heroes-6-avatar.jpg', '/uploads/heroes/heroes-6-header.jpg', TRUE, '2018-01-31 00:00:00', '2018-01-31 00:00:00'),
(7, 'Safiras', 'safiras', 'Opis Safiras', '/uploads/heroes/heroes-7-avatar.jpg', '/uploads/heroes/heroes-7-header.jpg', TRUE, '2018-01-31 00:00:00', '2018-01-31 00:00:00'),
(8, 'Magic Stars', 'magic-safiras', 'Opis Magic Stars', '/uploads/heroes/heroes-8-avatar.jpg', '/uploads/heroes/heroes-8-header.jpg', TRUE, '2018-01-31 00:00:00', '2018-01-31 00:00:00'),
(9, 'LEGO Nexo Knights', 'lego-nexo-knights', 'Opis Nexo Knights', '/uploads/heroes/heroes-9-avatar.jpg', '/uploads/heroes/heroes-9-header.jpg', TRUE, '2018-01-31 00:00:00', '2018-01-31 00:00:00');

TRUNCATE TABLE `_contest_prizes`;
INSERT INTO `_contest_prizes` (`id`, `contest_id`, `name`, `description`, `image_url`)
VALUES
(1, 1, 'Pudełko klocków LEGO', 'Opis', '/uploads/contest-prizes/1-1.jpg'),
(2, 1, 'Pudełko klocków LEGO', 'Opis', '/uploads/contest-prizes/1-2.jpg'),
(3, 2, 'Pudełko klocków LEGO', 'Opis', '/uploads/contest-prizes/2-3.jpg'),
(4, 2, 'Pudełko klocków LEGO', 'Opis', '/uploads/contest-prizes/2-4.jpg');

TRUNCATE TABLE `_static_sites`;
INSERT INTO `_static_sites` (`id`, `title`, `slug`, `content`, `is_active`)
VALUES
(1, 'O nas', 'o-nas', '<h1>O nas</h1><strong>Czy wiesz, że od ponad 18 lat wydajemy magazyny i książki dla dzieci?</strong>
<p>Na pewno znasz takie magazyny jak Scooby-Doo!, Cartoon Netwoork, Winx Club, które pochodzą z naszego portfolio. Postanowiliśmy pójść krok dalej i rozszerzyć naszą działalność. Właśnie oddajemy w Twoje ręce portal Konkursiaki.pl.</p>
<p class="center" style="margin: 50px 0;"><img src="/assets/images/media-service-zawada.png" /></p>
<h2>Zatem:</h2>
<ul>
	<li>Lubisz bezpiecznie surfować w internecie, bawić się</li>
	<li>i zdobywać nagrody? Twoi ulubieni bohaterowie to postacie znane z telewizyjnych kreskówek?</li>
</ul>
<h2>W takim razie Konkursiaki.pl są w sam raz dla Ciebie!</h2>
<p>Na naszej stronie znajdziesz wiele informacji o bohaterach, znanych z najpopularniejszych kanałów telewizyjnych. Poznasz ich z innej strony i dowiesz się, co u nich słychać. Ale przede wszystkim damy Ci okazję do wspaniałej zabawy!</p>
<h2>Zagraj o wspaniałe nagrody z twoimi ulubionymi bohaterami!</h2>
<p>Co dwa tygodnie znajdziesz tu nowy konkurs! Możesz próbować tyle razy, ile chcesz – poprawiać swoje wyniki i rywalizować z kolegami. Im aktywniej uczestniczysz w konkursach, tym więcej punktów i – przyznawanych za nie – odznak masz na koncie.</p>
<h2>Zostań supergraczem!</h2> <p class="center"><img src="/assets/images/okladki.jpg" /></p>', 1),

(2, 'Dla rodziców', 'dla-rodzicow', '<h1>Dla rodziców</h1><h2>Specjalnie dla Waszych dzieci przygotowaliśmy serwis Konkursiaki.pl.</h2>
<p>Miłośnicy gier i kreskówek znajdą tu informacje o ulubionych bohaterach oraz porcję dobrej – a przede wszystkim bezpiecznej zabawy. Serwis przeznaczony jest dla dzieci od lat sześciu, ale rejestracja może się odbyć jedynie za zgodą rodziców. Dlatego w chwili, gdy Wasze dziecko dokonuje rejestracji, musi podać e-mail rodzica lub opiekuna, żeby otrzymał on stosowną informację.</p>
<h2>Cały czas dbamy o to, by na naszych stronach pojawiały się bezpieczne treści.</h2>
<p class="center"><img src="/assets/images/certyfikat-ssl.jpg" /></p><p>Nad serwisem czuwają specjaliści odpowiedzialni między innymi za redagowanie tematów w wydawanych przez nas magazynach dla najmłodszych. Starannie dobieramy też nagrody dla zwycięzców konkursów – prezenty mają certyfikaty bezpieczeństwa i są dopasowane do wieku dziecka.  Oczywiście, równie starannie dobieramy reklamy pojawiające się na naszych stronach. Zarówno użytkownikom serwisu, jak i ich rodzicom polecamy jedynie artykuły dozwolone dla dzieci i dla nich przeznaczone.</p>
<h2>Mamy nadzieję, że zaufają Państwo nam i naszemu serwisowi.</h2> <p>Zespół Konkursiaków.pl</p>', 1),

(3, 'Regulamin', 'regulamin', '<h1>Regulamin</h1><p>
  <strong>REGULAMIN SERWISU INTERNETOWEGO WWW.KONKURSIAKI.PL</strong>
</p>
<p>
  <strong>Dla konkursów rozpoczynających się od dnia 1 października 2016r.</strong>
</p>
<p>
  <strong>UWAGA</strong>: Każdy uczestnik (rodzic lub opiekun osoby małoletniej) przed podjęciem decyzji o udziale w konkursie powinien zapoznać się z niniejszym Regulamin serwisu zamieszczonym na stronie <a href="http://www.konkursiaki.pl/">www.konkursiaki.pl</a>, regulaminem poszczególnego konkursu  oraz Polityką prywatności na stronie <a href="http://www.konkursiaki.pl/">www.konkursiaki.pl</a>.
</p>
<p>
  <strong>ART. I. POSTANOWIENIA OGÓLNE</strong>
</p>
<ol><li>Serwis internetowy <a href="http://konkursiaki.pl/">www.konkursiaki.pl</a> (zwany dalej: <strong>Serwisem</strong>) prowadzony jest przez przedsiębiorcę Media Service Zawada Sp. z o. o. z siedzibą: 04-028 Warszawa, al. Stanów Zjednoczonych 51, wpisaną do rejestru przedsiębiorców prowadzonego przez Sąd Rejonowy dla m.st. Warszawy w Warszawie, XIII Wydział Gospodarczy KRS, pod numerem 000027679, NIP 113-00-94-477 (zwany dalej: <strong>Administratorem</strong>).</li>
<li>Administrator Serwisu odpowiada za wszelkie zamieszczone w nim treści.</li>
<li>Niniejszy regulamin (zwany dalej: <strong>Regulaminem</strong>) określa zasady korzystania z Serwisu i przeprowadzanych przez Administratora konkursów.
</li><li>Administrator jest jednocześnie organizatorem konkursów.</li>
<li>Konkurs ma charakter przyrzeczenia publicznego w rozumieniu art. 921 ustawy z dnia 23 kwietnia 1964 kodeks cywilny a Organizator jest wydającym nagrody w rozumieniu tego artykułu.</li>
<li>Konkurs jest prowadzony na terenie Polski.</li>
<li>Konkurs prowadzony jest w języku polskim.</li>
<li><strong>Małoletni w konkursie.</strong> W przypadku kiedy uczestnikiem konkursu będzie osoba małoletnia, która nie przekroczyła 16 roku życia, oświadczenie o akceptacji regulaminu, może wyrazić taka osoba, jeśli nie jest to połączone z przekazywaniem danych osobowych. W innym przypadku oświadczenia o zapoznaniu się z polityką prywatności, bądź inne oświadczenia jakie mogą znajdować się na stronie Serwisu ( w tym dotyczące wszelkich zgód) wyraża rodzic lub opiekun prawny uczestnika. Użytkownik przed wzięciem udziału w konkursie powinien zapoznać się z treścią Regulaminu konkursu i Polityką prywatności, które są dostępne w wersji PDF na stronie <a href="http://konkursiaki.pl/">www.konkursiaki.pl</a>. Użytkownik ma prawo ich pobrania dla celów dowodowych.</li>
</ol><p>
    <strong>ART. II. PRZETWARZANIE DANYCH OSOBOWYCH</strong>
  </p>
<ol><li>Użytkownik Serwisu (dalej Użytkownik) przy rejestracji podaje dane osobowe: imię i nazwisko, adres zamieszkania (adres do doręczenia nagrody, jeśli jest inny niż adres zamieszkania); co jest niezbędnym warunkiem uczestniczenia w konkursach, wzajemnej komunikacji oraz wysłania nagród rzeczowych.</li>
<li>Użytkownik może zostać poproszony również o podanie innych danych. Ich przekazanie jest dobrowolne, a ich przetwarzanie nastąpi wyłącznie na podstawie zgody Użytkownika.</li>
<li>Pozyskiwanie danych osobowych Użytkownika i ich przetwarzanie  przez Administratora będzie odbywać się wyłącznie zgodnie z przepisami prawa w tym zgodnie z Rozporządzeniem Parlamentu Europejskiego i Rady (UE) 2016/46/WE, dalej RODO, oraz  zgodnie z ustawą z dn. 18 lipca 2002 r. o świadczeniu usług drogą elektroniczną (Dz. U. 2002 r, Nr 144, poz. 1204, z późn. zm.). Administrator wskazany w ust. 1 Regulaminu jest jednocześnie administratorem danych osobowych w rozumieniu RODO.</li>
<li>Przetwarzanie i ochrona danych osobowych Użytkownika Serwisu odbywać się będzie zgodnie z zasadami zawartymi w Polityce Prywatności zamieszczonej na stronie <a href="http://konkursiaki.pl/">www.konkursiaki.pl</a>.</li>
<li>W Polityce Prywatności określone są szczegółowo procedury dotyczące zasad pozyskiwania danych, udzielania zgód a także określone są uprawniania osoby, której dane są przetwarzane. Użytkownik powinien skontaktować się z Administratorem stosownie do zasad wskazanych w Polityce Prywatności.</li>
<li><span style="text-decoration:underline;">WAŻNE.</span> Przed przystąpieniem do konkursy oraz wyrażeniem jakiejkolwiek zgody z nim związanym (też drogą elektroniczną) Użytkownik (jego rodzic/opiekun prawny) powinien najpierw zapoznać się z Polityką prywatności. </li>
</ol><p>
    <strong>ART. III. KONTAKT Z ADMINSTRATOREM</strong>
  </p>
<p>
    Użytkownik może kontaktować się z Administratorem:
  </p>
<ol><li>Drogą pocztową, pod adresem: Media Service Zawada Sp. z o.o. z siedzibą: 04-028 Warszawa, al. Stanów Zjednoczonych 51.</li>
<li>Za pośrednictwem poczty elektronicznej: <a href="mailto:konkursiaki@konkursiaki.pl">konkursiaki@konkursiaki.pl</a>, telefonicznie: +48 22 870 53 43 lub faxem: +48 22 870 75 51.</li>
</ol><p>
    <strong>UWAGA</strong>: koszt połączenia telefonicznego Uczestnika z podanym powyżej numerem nie będzie wyższy niż normalny koszt zwykłych połączeń telefonicznych ustalonych przez dostawcę usług telefonicznych z jakich korzysta Uczestnik.
  </p>
<p>
    <strong>ART. IV. WYMAGANIA TECHNICZNE</strong>
  </p>
<p>
    W celu korzystania z Serwisu przez Użytkownika konieczne jest spełnienie poniższych minimalnych warunków technicznych:
  </p>
<ol><li>Dostęp do Internetu w czasie, w jakim organizowane będą konkursy na stronie Serwisu.</li>
<li>Dostęp do przeglądarki internetowej; wymagania co do wsparcia przeglądarek:
<ul><li>Chrome &gt;= 33.0</li>
<li>Firefox &gt;= 27</li>
<li>Internet Explorer &gt;= 8 (nie zalecana: niektóre gry w html5 mogą nie działać poprawnie)</li>
<li>dodatkowe wymagania:
<ul><li>minimalna rozdzielczość ekranu: 1024x768 pikseli</li>
<li>flash: niektóre gry mogą wymagać zainstalowania wtyczki Flash</li>
<li>włączony JavaScript</li>
<li>włączone cookies oraz zgoda użytkownika na wykorzystywanie ich przez Serwis</li>
<li>zalecane jest wyłączenie wtyczek typu adblock</li>
</ul></li>
</ul></li><li>W razie awarii systemu, która uniemożliwia korzystania z Serwisu, Administrator zamieści na stronie informację o awarii.</li>
<li><strong>W przypadku </strong>urządzenia teleinformatycznego (telefon) powinien on umożliwić wysyłanie wiadomości SMS zgodnie z definicją.</li>



</ol><p>
W razie awarii systemu, która uniemożliwia korzystania z Serwisu, Organizator Konkursu zamieści na stronie informację o awarii; <strong>przerwa nie będzie jednak miała wpływu na uzyskane przez Uczestnika do tego momentu korzyści (punkty, nagrody etc.)</strong>.
</p>
<p>
<strong>ART. V. REJESTRACJA W SERWISIE</strong>
</p>
<ol><li>Użytkownikiem Serwisu jest każda osoba odwiedzająca Serwis.</li>
<li>Użytkownicy Serwisu dzielą się na zarejestrowanych oraz nie zarejestrowanych.</li>
<li>Rejestracja w Serwisie nie jest obowiązkowa.</li>
<li>Rejestracja i korzystanie z Serwisu jest bezpłatne.</li>
<li>Użytkownik nie zarejestrowany to osoba, która nie dokonała rejestracji w Serwisie. Brak rejestracji oznacza ograniczony dostęp do Serwisu.</li>
<li>Użytkownik zarejestrowany to osoba, która dokonała pełnej rejestracji i aktywowała swoje konto w Serwisie. Ma ona pełny dostęp do niemal wszystkich elementów Serwisu, z wyjątkiem tych, do których dostęp jest ograniczony kodem lub wymagają odblokowania poprzez wymianę punktów.</li>
<li>Każdy Użytkownik może się zarejestrować wyłącznie pod jednym Nickiem, któremu może być przypisany wyłącznie jeden adres zamieszkania (adres do doręczenia nagrody).</li>
<li>Rejestracja osoby małoletniej, która nie ukończyła 13 lat powinna zostać dokonana przez jej rodzica (opiekuna prawnego), a osoby, która ukończyła 13 lat ale nie ukończyła 18 lat, powinna zostać potwierdzona przez rodzica (opiekuna prawnego).</li>
<li>Dane osobowe podane podczas rejestracji muszą zostać potwierdzone przez aktywację linku przesłanego drogą mailową na podany przez Użytkownika adres e-mail.</li>
<li>Nagrody są przyznawane tylko tym użytkownikom, którzy mają uzupełnione wszystkie dane, tak jak wskazuje formularz rejestracji. Brak takich danych jak imię, nazwisko użytkownika i jego  rzeczywisty adres korespondencyjny, uniemożliwia Administratorowi dokonanie weryfikacji danych potrzebnych do przyznania i wysłania nagrody. Użytkownik w każdej chwili może uzupełnić swoje dane poprzez formularz Edytuj profil.</li>
</ol><p>
<strong>ART. VI. ZASADY UCZESTNICZENIA W KONKURSACH, KONTA, WERYFIKACJA LAUREATÓW</strong>
</p>
<ol><li>W celu umożliwienia uczestniczenia w konkursach jak najszerszemu gronu użytkowników i ograniczenie uczestniczenia w konkursach osób, które poprzez swoje, sprzeczne z regulaminem działania, w tym wykorzystywanie środków technicznych, organizacyjnych lub oprogramowania - uzyskują niczym nie uzasadnioną przewagę nad innymi uczestnikami i w rezultacie ograniczają możliwości wygrania nagród przez inne osoby, Administrator wprowadza następujące zasady:
<ul><li>Każdy Użytkownik ma prawo do założenia tylko jednego konta w Serwisie, w ramach jednego konkursu, jeden Uczestnik może wykorzystywać wyłącznie tylko jedno urządzenie teleinformatyczne: komputer albo telefon (smartfon) albo tablet albo inne urządzenie przeznaczone do komunikacji elektronicznej.</li>
<li>Do każdego Użytkownika może być przypisany tylko jeden adres korespondencyjny (adres do doręczenia nagrody).</li>
<li>W ramach jednego konkursu, pod jeden adres wskazany jako adres Użytkownika może zostać przekazana nie więcej niż 1 (jedna) nagroda.</li>
</ul></li><li>Zabrania się wykorzystywania przez Użytkownika w celu uzyskania wygranej, środków technicznych, organizacyjnych lub oprogramowania, których jedynym celem jest bezzasadne zapewnienie lub zwiększenie możliwości wygrania nagrody w stosunku do innych uczestników konkursu, którzy nie korzystają z takich rozwiązań. W przypadku kiedy Użytkownik wykorzystywał środki wskazane w ust. 1, lit.d, Administrator uprawniony będzie do usunięcia uzyskanego w ten sposób wyniku, zawieszenia konta takiego Użytkownika na okres 30 dni; o podjęciu takich czynności Użytkownik zostanie poinformowany. W przypadku ponownego naruszenia tych zasad przez tego samego Użytkownika Administrator uprawniony będzie do usunięcia konta Użytkownika na stałe. Administrator poinformuje taką osobę w okresie do 48 godzin o zablokowaniu lub usunięciu konta. Administrator zastrzega sobie możliwości dokonania weryfikacji osoby laureata i miejsca jego zamieszkania w granicach, jakie dopuszczają bezwzględnie obowiązujące przepisy prawa.</li>
<li>Nagrody zostaną doręczone wyłącznie osobom (laureatom), które uczestniczyły w konkursie z zachowaniem wymagań Regulaminu.</li>
<li>Biorąc udział w Konkursie, Użytkownik nie będzie dostarczać treści bezprawnych, w szczególności używać obraźliwych oznaczeń (nicków).</li>
<li>Nagroda będzie doręczona do miejsca zamieszkania laureata w sposób zgodny z przepisami prawa, w tym prawa pocztowego; tożsamość odbiorcy zostanie ustalona stosownie do obowiązujących przepisów. Nagroda będzie dostarczona nie później w terminie 30 dni od dnia poinformowania o zdobyciu nagrody.</li>
<li>Zabrania się używania obraźliwych i wulgarnych Nazw Użytkownika (nick) w Serwisie. Nazwy Użytkownika naruszające ten punkt Regulaminu będą usuwane przez Administratora Serwisu.</li>
<li>Każdy Użytkownik jest wyłącznie odpowiedzialny za sposób korzystania ze swojego konta w Serwisie, w tym podejmowania decyzji o uczestniczeniu w konkursie bądź dokonywanie wpisów.</li>
<li>Nazwa Użytkownika umożliwiająca zalogowanie, powinna być anonimowa, to jest nie powinna zawierać prawdziwych danych osobowych Użytkownika (np. imię i nazwisko). Nazwa Użytkownika będzie przetwarzana przez Administratora tak jak inne dane osobowe Użytkownika.</li>


</ol><p>
<strong>ART. VII. KONKURSY - PUNKTY - ODZNAKI I RANGI – RANKINGI</strong>
</p>
<ol><li>Administrator Serwisu po uzyskaniu zgody na przetwarzanie danych osobowych Użytkownika będzie uprawniony do zamieszczenia na stronie Serwisu Nazwy Użytkownika.</li>
<li>W każdym przypadku Użytkownik przed wzięciem udziału w konkursie powinien zapoznać się z jego Regulaminem i Polityką Prywatności.</li>
<li>W konkursach organizowanych przez Administratora z wykorzystaniem Serwisu mogą brać udział wszystkie osoby, ale tylko wyniki osób zarejestrowanych i zalogowanych będą brane pod uwagę w rankingach konkursów.</li>
<li>Pracownicy Administratora, osoby przez niego zatrudnione na podstawie umowy cywilnej oraz ich dzieci nie mogą uczestniczyć w konkursach organizowanych w ramach Serwisu.</li>
<li>Nagrody przyznawane w konkursach organizowanych w Serwisie nie podlegają wymianie na inne nagrody rzeczowe albo nagrody pieniężne. Użytkownik Serwisu może zostać laureatem tylko jednej nagrody w ramach jednego konkursu.</li>
<li>Laureaci konkursów o wygranej w konkursie zostaną poinformowani drogą mailową oraz otrzymają dodatkowo komunikat o wygranej po zalogowaniu się do Serwisu.</li>
<li>Lista laureatów każdego konkursu będzie opublikowana w Serwisie w terminie najpóźniej 21 dni od dnia zakończenia konkursu. Laureaci zostaną wymienieni poprzez wykorzystanie Nazwy Użytkownika, w kolejności odpowiadającej ilości zdobytych przez nich punktów. Zasady naliczania punktów Użytkownikowi i wyłaniania laureatów zamieszczone będą w regulaminach poszczególnych konkursów.</li>
<li>Odbiór nagrody. Nagrody przyznane w konkursach organizowanych w ramach Serwisu zostaną przesłane pocztą – przesyłką pocztową w terminie 30 dni od momentu opublikowania listy laureatów w Serwisie. Wysłanie nagrody będzie poprzedzone prośbą Administratora, wysłaną e-mailem o potwierdzenie adresu, na jaki ma zostać przesłana nagroda. W przypadku kiedy adres podany w procesie rejestracji uległ zmianie, Użytkownik powinien dokonać jego aktualizacji.</li>
<li>Użytkownicy otrzymują PUNKTY za następujące aktywności:<br /><table><tr><td>
  <strong>Lp.</strong>

</td>
<td><strong>Nazwa aktywności</strong>
</td>
<td><strong>Ilość punktów</strong>
</td>
<td><strong>Częstotliwość przyznawania punktów</strong>
</td>
</tr><tr><td>1
</td>
<td>rejestracja w serwisie
</td>
<td>5
</td>
<td>jednorazowo
</td>
</tr><tr><td>2
</td>
<td>logowanie w serwisie
</td>
<td>1
</td>
<td>1 / dzień
</td>
</tr><tr><td>3
</td>
<td>rejestracja dokonana przez zaproszonego znajomego
</td>
<td>5
</td>
<td>1 / użytkownik
</td>
</tr><tr><td>4
</td>
<td>udział w konkursie
</td>
<td>5
</td>
<td>1 / konkurs
</td>
</tr><tr><td>5
</td>
<td>punkty za zwycięstwo w konkursie: 100 punktów za I miejsce, drugie = 99 pkt, itd. 100 = 1 pkt.
</td>
<td>
</td>
<td>1 / konkurs
</td>
</tr><tr><td>6
</td>
<td>Punkty za zwycięstwo w konkursie specjalnym: 200 punktów za I miejsce, drugie – 199 pkt, itd. 200 miejsce – 1 pkt
</td>
<td>
</td>
<td>1 / konkurs
</td>
</tr><tr><td>7
</td>
<td>poprawna odpowiedź w quizie
</td>
<td>2
</td>
<td>1 / dzień
</td>
</tr><tr><td>8
</td>
<td>Poprawienie swojego najlepszego wyniku w grze
</td>
<td>1
</td>
<td>1 / za każdy poprawiony wynik
</td>
</tr></table></li>
<li>Liczba punktów za konkretne aktywności mogą być podwajane w wybranych okresach czasu w związku z akcjami specjalnymi prowadzonymi w serwisie (np. konkursy specjalne). W takich sytuacjach użytkownik będzie o tym powiadamiany.</li>
<li>Za wykonanie określonych zadań Użytkownikowi zostaną przyznane odznaki:<br /><table><tr><td>
<strong>Odznaka</strong>

</td>
<td><strong>Zadanie</strong>
</td>
</tr><tr><td>CHAMPION. Jest w czołówkach rankingów!
</td>
<td>Odznaka przyznawana jest za bycie w 5 różnych konkursach w pierwszej 50.
</td>
</tr><tr><td>FAJTER. Nie poddaje się!
</td>
<td>Odznaka przyznawana jest za bycie w ostatniej 50. w 5 różnych konkursach.
</td>
</tr><tr><td>FAN. Często nas odwiedza!
</td>
<td>Odznaka przyznawana jest za zalogowanie się min. 20 razy w miesiącu, w tym co najmniej raz dziennie przez kolejne 20 dni
</td>
</tr><tr><td>GAMER. Lubi grać!
</td>
<td>Odznaka przyznawana jest za min. 150 gier miesięcznie. Daje dostęp do konkursów specjalnych
</td>
</tr><tr><td>FRIEND. Towarzyski!
</td>
<td>Odznaka przyznawana jest za 15 zarejestrowanych znajomych, którzy trafili do nas poprzez Twoje zaproszenie polecenia. Daje dostęp do nowych filmów.
</td>
</tr></table></li>
<li>Liczba zebranych punktów i ilość wykonanych zadań świadczą o randze użytkownika:<br /><table><tr><td>
<strong>Ranga Użytkownika</strong>

</td>
<td><strong>Punktacja</strong>
</td>
</tr><tr><td>PLAYER
</td>
<td><strong>5</strong>
</td>
</tr><tr><td>STAR PLAYER
</td>
<td><strong>500</strong>
</td>
</tr><tr><td>TOP PLAYER
</td>
<td><strong>1000</strong>
</td>
</tr><tr><td>KONKURSIAK
</td>
<td><strong>5000</strong>
</td>
</tr></table></li>
<li>Zarówno odznaki, jak i rangi, mogą w wybranych okresach czasu pozwalać ich posiadaczom na dostęp do treści Serwisu ograniczonych dla innych użytkowników.</li>
<li>Liczba punktów użytkownika określa jego miejsce w rankingach prowadzonych w Serwisie.</li>
</ol><p>
<strong>ART. VIII. RANKINGI I WYMIANA PUNKTÓW</strong>
</p>
<p>
W ramach serwisu prowadzone są 3 rodzaje rankingów – konkursów, miesięczny i roczny.
</p>
<ol><li>Ranking miesięczny uwzględnia pierwszych 50 Użytkowników wg. punktów zdobytych w miesiącu.</li>
<li>Ranking roczny uwzględnia pierwszych 50 Użytkowników wg. punktów zdobytych w danym roku.</li>
<li>Ranking roczny premiowany jest nagrodą roczną. Nagroda przyznawana jest użytkownikowi z największą liczbą punktów w tym rankingu. W przypadku uzyskania takiej samej liczby punktów przez więcej niż jedna osobę, pod uwagę brana będzie liczba zwycięstw i kolejność miejsc w zajętych konkursach.</li>
<li>Ranking miesięczny premiowany jest nagrodą miesięczną. Nagroda przyznawana jest Użytkownikowi z największą liczbą punktów w tym rankingu. W przypadku uzyskania takiej samej liczby punktów przez więcej niż jedna osobę, pod uwagę brana będzie liczba zwycięstw i kolejność miejsc w zajętych konkursach.</li>
<li>Nagroda miesięczna może być przyznana temu samemu Użytkownikowi 3 razy w ciągu danego cyklu rankingu rocznego.</li>
<li>Ranking roczny kończy się z dniem 30 września każdego roku a nowy ranking rozpoczyna się z dniem 1 października każdego roku. Z dniem rozpoczęcia nowego rankingu rocznego wszystkie dotychczas zdobyte punkty zostaną wyzerowane,</li>
<li>Jednocześnie, Użytkownikom przyznane zostają jednorazowo punkty w zależności od miejsca, jakie uzyskali w już zakończonym w rankingu:
<ul><li>50 pkt. – użytkownikom posiadającym 10 000 pkt. i więcej</li>
<li>25 pkt. – użytkownikom posiadającym od 2 000 pkt. do 9 999</li>
<li>10 pkt. – użytkownikom posiadającym od 1 000 pkt. do 1 999</li>
<li>5 pkt. – reszcie użytkowników</li>
</ul></li>
<li>Listy laureatów rankingów miesięcznych i rocznego będą opublikowane na stronie Serwisu w terminie najpóźniej 14 dni roboczych od momentu zakończenia danego okresu rankingowego. Laureaci zostaną wymienieni według Nazwy Użytkownika i w kolejności jaka odpowiada liczbie zdobytych przez nich punktów.</li>
<li>Zabrania się wykorzystywania przez Użytkownika w celu uzyskania punktów, środków technicznych, organizacyjnych lub oprogramowania, których jedynym celem jest bezzasadne zapewnienie lub zwiększenie możliwości zdobycia punktów w stosunku do innych Użytkowników Serwisu, którzy nie korzystają z takich rozwiązań.</li>
<li>W przypadku kiedy Użytkownik wykorzystywał środki wskazane w Art. VI, ust. 1, lit. d, Administrator uprawniony będzie do usunięcia uzyskanych w ten sposób punktów, zawieszenia konta takiego Użytkownika na okres 30 dni; w przypadku ponownego naruszenia tych zasad przez tego samego Użytkownika Administrator uprawniony będzie do usunięcia konta Użytkownika; Administrator poinformuje taką osobę w okresie do 48 godzin o zablokowaniu lub usunięciu konta.</li>
<li>Użytkownicy mogą wymieniać zgromadzone przez nich punkty na dostępy do zablokowanych treści w serwisie. Odbywać się to będzie za pomocą formularza wymiany punktów w profilu użytkownika. Liczba punktów oraz rodzaj treści będą każdorazowo podane w formularzu.</li>
<li>Wymienione punkty zostaną odjęte od puli punktów użytkownika. Jeśli po odjęciu punktów użytkownik będzie miał ich za mało niż przewidują to wymogi posiadanej rangi – Użytkownik jej nie straci.</li>
</ol><p>
<strong>ART. IX. INFORMACJE O NOWYCH KONKURSACH</strong>
</p>
<p>
Pod warunkiem wyrażenia odrębnej zgody przez Użytkownika, Administrator może przesyłać mu informacje marketingowe (informacje handlowe) w tym o nowych konkursach organizowanych przez Administratora na podany przez Użytkownika adres poczty elektronicznej przy wykorzystaniu telekomunikacyjnych urządzeń końcowych (komputery, telefony etc.) i automatycznych systemów wywołujących. Szczegółowe postanowienia w tym zakresie zamieszczone są w Polityce prywatności na stronie <a href="http://konkursiaki.pl/">www.konkursiaki.pl</a>. Użytkownik Serwisu ma prawo do wycofania takiej zgody.
</p>
<p>
<strong>ART. X. REKLAMACJE</strong>
</p>
<ol><li>Każdemu Użytkownikowi przysługuje prawo wniesienia reklamacji związanej z rozstrzygnięciem konkursu. Reklamacje powinno składać się w terminie do 30 dni od dnia zakończenia Konkursu.</li>
<li>Reklamacje mają zastosowanie także do usunięcia punktów, zawieszenia lub usunięcia konta Użytkownika.</li>
<li>Reklamacje można zgłaszać do Administratora: drogą pocztową, pod adresem: Media Service Zawada sp. z o.o. z siedzibą: 04-028 Warszawa, al. Stanów Zjednoczonych 51 albo za pośrednictwem poczty elektronicznej: <a href="mailto:kontakt@msz.com.pl">kontakt@konkursiaki.pl</a>, albo faxem: +48 22 870 75 51.</li>
<li>W reklamacji należy zaznaczyć: „Reklamacja", podać nazwę konkursu, wskazując co jest przedmiotem reklamacji. Uczestnik może też wskazać jakiego rozstrzygnięcia oczekuje od Organizatora.</li>
<li>Reklamacja zostanie rozpatrzona najpóźniej w ciągu 14 dni od jej otrzymania.</li>
<li>Powyższe terminy nie zmieniają terminów zgłaszania reklamacji jakie wynikają z przepisów prawa.</li>
<li>Postępowanie reklamacyjne dotyczy także przekazanych Użytkownikowi nagród.</li>
<li>Do wydanych nagród (rzeczy) mają zastosowanie uprawnienia gwarancyjne w przypadku ich udzielenia. Administrator zapewnia, iż przekazywane przez niego Laureatom nagrody są bez wad. W przypadku zaistnienia wady, laureat konkursu, przesyła wadliwą nagrodę na koszt organizatora na podany powyżej adres. W reklamacji laureat może zaznaczyć jakiego rozstrzygnięcia oczekuje.</li>
<li>Reklamacja zostanie rozpatrzona najpóźniej w ciągu 14 dni od jej otrzymania. Organizator udzieli odpowiedzi o rozstrzygnięciu na adres wskazany przez Laureata.</li>
<li>Laureat ma prawo, niezależnie od przysługujących mu uprawnień z tytułu udzielonej gwarancji, wykonywać uprawnienia z tytułu rękojmi.</li>
<li>W przypadku braku gwarancji Laureatowi przysługują uprawnienia z tytułu rękojmi.</li>
</ol><p>
<strong>ART. XI. ALTERNATYWNE ROZSTRZYGANIE SPORÓW</strong>
</p>
<p>
Każdy uczestnik konkursu, jako konsument, jeśli jego zgłoszenie reklamacyjne nie zostanie rozstrzygnięte zgodnie z oczekiwaniem, nie będzie w ogóle rozpatrzone albo reklamacja nie została przyjęta, jest uprawniony do skorzystania z procedury pozasądowego rozwiązywania sporów. Ma między innymi następujące możliwości:
</p>
<ol><li>zwrócenie się do Wojewódzkiego Inspektora Inspekcji Handlowej z wnioskiem o wszczęcie postępowania mediacyjnego w sprawie polubownego zakończenia sporu. Informacje dotyczące procedury mediacyjnej znajdują sie w siedzibach oraz na stronach internetowych poszczególnych Wojewódzkich Inspektoratów Inpsekcji Handlowej; Wojewódzki Inspektor Inspekcji Handlowej właściwy dla siedziby MSZ Sp. z o.o.: <strong>Wojewódzki Inspektorat Inspekcji Handlowej ul. Sienkiewicza 3, 00-015 Warszawa, <a href="mailto:ih_warszawa@wiih.org.pl">ih_warszawa@wiih.org.pl</a>,</strong></li>
<li>zwrócenie się do stałego polubownego sądu konsumenckiego działającego przy Wojewódzkim Inspektorze Inspekcji Handlowej z wnioskiem o rozstrzygnięcie sporu wynikłego z zawartej umowy. Wykaz stałych polubownych sądów konsumenckich znajduję się na stronie internetowej Urzędu Ochrony Konkurencji Konsumentów pod adresem <a href="http://www.uokik.gov.pl/wazne_adresy.php">www.uokik.gov.pl/wazne_adresy.php</a>,</li>
<li>zwrócenie się o bezpłatną pomoc prawną do miejskiego lub powiatowego rzecznika konsumentów lub organizacji społecznej, do której zadań statutowych należy ochrona konsumentów, m.in. Federacji Konsumentów - adres strony internetowej; <a href="http://www.federacja-konsumentow.org.pl/">www.federacja-konsumentow.org.pl</a>.</li>
<li>wykorzystania insytucji mediacji przewidzianej przez przepisy ustawy z 17 listopada 1964 r. kodeks postępowania cywilnego (Dz.U.nr 43, poz. 296, ze zm.), art 183(1) i następne kpc.</li>
<li>W przypadku zawierania umów przy wykorzystaniu Internetu ( umowy sprzedaży lub umowy o świadczenie usług), skorzystanie z internetowego systemu rozstrzygania sporów konsumenckich (tzw. <strong>Platforma ODR</strong>), co jest omówione poniżej.</li>
</ol><p>
Szczegółowe informacje o pozasądowych sposobach rozpatrywania reklamacji i dochodzenia roszczeń, a także zasady dostępu do tych procedur dostępne są w siedzibach oraz na stronach internetowych powiatowych (miejskich) rzeczników konsumentów, organizacji społecznych, do których zadań statutowych należy ochrona konsumentów, Wojewódzkich Inspektoratów Inspekcji Handlowej oraz pod następującymi adresami Urzędu Ochrony Konkurencji i Konsumentów: <a href="http://www.uokik.gov.pl/spory_konsumenckie.php">www.uokik.gov.pl/spory_konsumenckie.php</a>, <a href="http://www.uokik.gov.pl/wazne_adresy.php">www.uokik.gov.pl/wazne_adresy.php</a>, <a href="http://www.uokik.gov.pl/sprawy_indywidualne.php">www.uokik.gov.pl/sprawy_indywidualne.php</a>.
</p>
<p>
Skorzystanie z pozasądowych sposobów rozpatrywania reklamacji i dochodzenia roszczeń ma charakter dobrowolny i może mieć miejsce, gdy obie strony sporu wyrażą na to zgodę.
</p>
<p>
Pełna lista podmiotów, które są uprawnione do pozasądowego rozwiązywania sporów, których stroną jest konsument znajduję się na stronie internetowej UOKIK: <a href="http://www.uokik.gov.pl/">www.uokik.gov.pl</a>. Listę prowadzi Prezez UOKiK.
</p>
<p>
Zalecane jest skorzystanie z przewidzianej w regulaminie procedury reklamacyjnej, gdyż zgodnie z art. 34 ust. 2 pkt. 1 ustawy z dnia 23 września 2016 r, o pozasądowym rozwiązywaniu sporów konsumenckich (Dz.U. z 9 listopada 2016 r, poz. 1823), podmiot uprawniony do prowadzenia postępowania w sprawie pozasądowego rozwiązywania sporów konsumenckich może odmówić wszczęscia postępowania, jeżeli konsument nie podjął wcześniejszej próby kontaktu z przedsiębiorcą, np. w formie złożenia reklamacji. Uczestnik konkursu (konsument) może skontaktować się z Media Service Zawada Sp. z o.o.: <strong><a href="mailto:recepcja@msz.com.pl">recepcja@msz.com.pl</a></strong>
</p>
<p>
<strong>PLATFORMA ODR</strong>
</p>
<p>
Zgodnie z rozporządzeniem Parlamentu Europejskiego i Rady (UE) Nr 524/2013 z dnia 21 maja 2013 r. w sprawie internetowego systemu rozstrzygania sporów konsumenckich oraz zmiany rozporządzenia (WE) nr 2006/2004 i dyrektywy 2009/22/WE (rozporządzenie w sprawie ODR w sporach konsumenckich), konsument (uczestnik konkursu) może również skorzystać z platformy internetowego systemu rozstrzygania sporów (<strong>platforma ODR</strong>),
</p>
<p>
Dostęp do platformy ODR zapewnia łącze internetowe: <strong>ec.europa.eu/consumers/odr</strong>
</p>
<p>
Europejska platforma ODR ma ułatwiać przede wszystkim szybkie i sprawiedliwe pozasądowe rozstrzyganie przez Internet sporów między konsumentami i przedsiębiorcami dotyczących zobowiązań umownych wynikających z internetowych umów sprzedaży lub umów o świadczenie usług zawieranych między konsumentami mieszkającymi w Unii a przedsiębiorcami mającymi siedzibę w Unii.
</p>
<p>
Uczestnik konkursu (konsument) może skontaktować  się z organizatorem Media Service Zawada Sp. z o.o.: <strong><a href="mailto:recepcja@msz.com.pl">recepcja@msz.com.pl</a></strong>
</p>
<p>
W przypadku osób małoletnich wskazane powyżej czynności powinny być wykonane (lub) potwierdzone przez rodziców (opiekunów prawnych).
</p>
<p>
<strong>ART. XII. ZAKRES REGULAMINU</strong>
</p>
<p>
Postanowienia Regulaminu mają zastosowanie do konkursów jakie są organizowane w ramach Serwisu. Okres trwania konkursu ten nie ma wpływu na prawa i obowiązki Użytkownika jakie mają do niego zastosowanie w okresie trwania konkursu, które przysługują mu wprost z regulaminu (np. prawa do otrzymania nagród, prawo do zgłaszania reklamacji), bądź wynikają z przepisów prawa (uprawnienia gwarancyjne, z tytułu rękojmi, itp.).
</p>
<p>
<strong>ART. XIII. POSTANOWIENIA KOŃCOWE</strong>
</p>
<ol><li>Do Konkursu stosować się będzie w szczególności postanowienia ustawy z 30 maja 2014 r. o prawach konsumenta oraz z 18 lipca 2002 r. o świadczeniu usług drogą elektroniczną. (Dz. U. z 2002 r. Nr 144, poz.1204, z późn. zm.).</li>
<li>Nie jest dopuszczalne wysyłanie wiadomości polecającej Serwis samemu sobie lub na fikcyjne konto. Zaistnienie sytuacji wskazanej powyżej powoduje usunięcie takiego konta z Serwisu przez Administratora. Użytkownik przyjmuje do wiadomości, że do uczestniczenia w konkursach, skutecznej komunikacji, w tym przekazania nagrody niezbędne jest podanie prawdziwych danych. W przypadku zmiany przez Użytkownika wcześniej podanych danych, Użytkownik powinien niezwłocznie przekazać aktualne dane.</li>
<li>Regulamin jest dostępny w siedzibie Administratora oraz na stronie <a href="http://konkursiaki.pl/">www.konkursiaki.pl</a>. w wersji PDF i może być pobrany przez każdego uczestnika dla celów dowodowych.</li>
<li>Każdy konkurs ma swój własny Regulamin.</li>
</ol>', 1),
(4, 'Polityka prywatności', 'polityka-prywatnosci', '<h1>Polityka prywatności</h1><strong>Konkursiaki.pl - Polityka prywatności i informacyjna</strong></p>
<p>W celu zapewnienia osobom udostępniających dane niezbędnych i wyczerpujących informacji dotyczących w szczególności podmiotu, którym dane są przekazywane, celów przetwarzania, podstawy prawnej przetwarzania a także zasad wzajemnej komunikacji, Spółka na podstawie art. 12 i art. 13 Rozporządzenia Parlamentu Europejskiego i Rady (UE) 2016/46/WE, dalej RODO, w trakcie pozyskiwania danych osobowych przekazuje następujące informacje</p>
<ol><li><strong>UWAGA!</strong> Przed wzięciem udziału w konkursie każdy Uczestnik (rodzic lub opiekun prawny) powinien zapoznać się z treścią niniejszej „Polityki prywatności i informacyjnej " oraz „Regulaminu konkursu".</li>
<li>Administratorem danych osobowych (dalej "<strong>Administrator")</strong> przetwarzanych w związku z korzystaniem ze strony internetowej <a href="http://www.konkursiaki.pl/">www.konkursiaki.pl</a> zgodnie z art. 4 pkt. 7 RODO jest Media Service Zawada Sp. z o.o. z siedzibą przy al. Stanów Zjednoczonych 51, 04-028 Warszawa, wpisana do rejestru przedsiębiorców, prowadzonego przez Sąd Rejonowy dla m.st. Warszawy, w Warszawie, XIII Wydział Gospodarczy KRS, pod numerem 000027679, NIP 113-00-94-477. Administrator działa zgodnie z przepisami prawa, w szczególności zgodnie z RODO oraz ustawą z dnia 18 lipca 2002 r. o świadczeniu usług drogą elektroniczną (Dz. U. 2002 r, nr 144, poz. 1204, z późn. zm., dalej ŚUEu).</li>
<li>W ramach działania serwisu <a href="http://www.konkursiaki.pl/">www.konkursiaki.pl</a> mogą być przekazywane innym podmiotom pozyskane dane osobowe użytkowników. Podmiotem odpowiedzialnym za przetwarzanie przekazanych danych osobowych jest Michał Łojewski prowadzący działalność gospodarczą pod firmą Gynkar, Michał Łojewski z siedzibą: ul. Chełmska 21, zarejestrowaną w Centralnej Ewidencji Działalności i Informacji Gospodarczej prowadzonej przez Ministra Gospodarki, posiadającej NIP 525-112-04-31, Regon 12659563.</li>
<li>Dostęp do danych osobowych użytkowników strony internetowej <a href="http://www.konkursiaki.pl/">www.konkursiaki.pl</a> (dalej Użytkownicy), mają wyłącznie osoby posiadające upoważnienie nadane przez Administratora danych osobowych. Osoby te są zobowiązane do zachowania w poufności informacji dotyczących danych osobowych i w razie niedopełnienia obowiązków podlegają odpowiedzialności dyscyplinarnej i przewidzianej przez przepisy prawa.</li>
<li>Administrator przetwarza dane osobowe podawane przez Użytkowników podczas rejestracji na stronie internetowej. Administrator prosi o dane osobowe: imię, nazwisko, adres zamieszkania, adres poczty e-mail, datę urodzenia oraz nazwę Użytkownika (nick). Dane te są umieszczone w bazie danych, zarejestrowanej przez GIODO. Administrator przetwarza i ma dostęp do danych Użytkownika.</li>
<li>Dane osobowe Użytkowników są przetwarzane w celu przeprowadzania cyklu konkursów organizowanych przez Media Service Zawada sp. z o.o, dla celów marketingu bezpośredniego, oraz określenia zachowań i preferencji Użytkowników. Użytkownik wyrazi zgodę na przetwarzanie swoich danych w powyższych celach.</li>
<li>Przetwarzanie danych osobowych Użytkowników odbywa się w oparciu o przepisy prawa (np. art. 6 ust. 1 pkt. b lub f RODO). W przypadku danych osób małoletnich, poniżej 16 roku życia, ich pozyskiwanie i przetwarzanie w celach wskazanych w ust.5, wymaga zgody rodzica/opiekuna prawnego.</li>
<li>Media Service Zawada Sp. z o.o. nie przekazuje ani nie sprzedaje danych osobowych Użytkowników żadnym innym podmiotom.</li>
<li>Użytkownik wszystkie dane osobowe podaje dobrowolnie a zgoda na ich przetwarzanie może zostać odwołana w każdym czasie. Użytkownikowi przysługują prawa opisane poniżej.</li>
<li>Użytkownik może wyrazić odrębną zgodę na otrzymywanie od Administratora informacji handlowych (marketingowych), w tym o nowych konkursach organizowanych przez Administratora za pośrednictwem środków komunikacji elektronicznej, w tym przy użyciu urządzeń telekomunikacyjnych urządzeń końcowych i automatycznych systemów wywołujących (art. 10 ustawy z 18 lipca 2002 r. o świadczeniu usług drogą elektroniczną i art. 172 w zw. z art.174 ustawy z 16 lipca 2004 Prawo telekomunikacyjne).</li>
<li>W celu umożliwienia otrzymywania wskazanych powyżej informacji Użytkownik może podać swoje dane, w tym numer telefonu lub adres poczty elektronicznej. Wykorzystywanie urządzeń komunikacji elektronicznych przez Administratora w celach opisanych w ust. 9 nie będzie odbywać się na koszt Użytkownika.</li>
<li>Treść oświadczeń o udzieleniu zgody na przetwarzanie danych osobowych i w celach marketingowych znajduje się na stronie <a href="http://www.konkursiaki.pl/">www.konkursiaki.pl</a></li>
<li>Każdy Użytkownik (jego rodzic lub opiekun prawny) ma prawo do: odwołania swojej zgody na przetwarzanie danych osobowych w celach związanych z organizacją konkursów, z tym że wycofanie tej zgody jest jednoznaczne z zamknięciem konta w serwisie;</li>
<li>Żądanie o treści: <strong>„Cofam moją zgodę na przetwarzanie danych osobowych moich i mojego dziecka w celach związanych z przeprowadzaniem konkursów organizowanych przez Media Service Zawada Sp. z o.o.",</strong> można skierować:
<ol><li>w formie pisemnej na adres Media Service Zawada Sp. z o.o., 04-028 Warszawa, al. Stanów Zjednoczonych 51; może to mieć formę listu poleconego,</li>
<li>jako e-mail na adres poczty elektronicznej Administratora: <a href="mailto:kontakt@konkursiaki.pl">kontakt@konkursiaki.pl</a>,</li>
<li>jako fax: +48 22 870 75 51,</li>
</ol></li>
<li>Wycofania zgody na otrzymywanie informacji handlowych, w tym o nowych konkursach organizowanych przez Administratora przesyłanych za pośrednictwem środków komunikacji elektronicznej, w tym przy użyciu urządzeń telekomunikacyjnych urządzeń końcowych i automatycznych systemów wywołujących; zgoda w tym zakresie może nastąpić w każdym czasie w sposób prosty i wolny od opłat. Żądanie o treści: <strong>„Cofam moją zgodę na przesyłanie mi informacji handlowych (marketingowych), przez Media Service Zawada Sp. z o.o., za pomocą środków komunikacji elektronicznej lub przy wykorzystaniu telekomunikacyjnych urządzeń końcowych i automatycznych systemów wywołujących."</strong> można skierować:
<ol><li>w formie pisemnej na adres Media Service Zawada Sp. z o.o., 04-028 Warszawa, al. Stanów Zjednoczonych 51; może to mieć formę listu poleconego,</li>
<li>jako e-mail na adres poczty elektronicznej Administratora: <a href="mailto:kontakt@konkursiaki.pl">kontakt@konkursiaki.pl</a>,</li>
<li>jako fax: +48 22 870 75 51,</li>
</ol><p>W przypadku, kiedy otrzymywanie informacji marketingowych odbywa się tylko w oparciu o art. 6 ust. 1 lit. f RODO, tj. kiedy nie jest wymagana zgoda uprawnionego, Użytkownik może zgłosić do Administratora sprzeciw dotyczący dalszego przetwarzania danych w powyższym celu, w formie i na adresy podane powyżej.</p>
</li>
<li>Administrator będzie kontaktował się z Użytkownikiem drogą elektroniczną na podany przez Użytkownika adres poczty elektronicznej.</li>
<li><strong>Kontakt z Administratorem.</strong> Użytkownik może kontaktować się z Administratorem, w tym także w celu realizowania swoich uprawnień podanych w ust. 8 i 9 (odwołanie zgody na przetwarzanie danych osobowych):
<ol><li>drogą pocztową: Media Service Zawada sp.  z o.o. z siedzibą: 04-028 Warszawa, al. Stanów Zjednoczonych 51,</li>
<li>za pośrednictwem poczty elektronicznej: <a href="mailto:kontakt@konkursiaki.pl">kontakt@konkursiaki.pl</a>, telefonicznie: +48 22870 53 43;</li>
<li>faxem: +48 22 870 75 51.</li>
</ol></li>
<li>Koszt połączenia telefonicznego Użytkownika z podanym powyżej numerem Administratora nie będzie wyższy niż normalny koszt zwykłych połączeń telefonicznych ustalonych przez dostawcę usług telefonicznych, z jakich korzysta Użytkownik.</li>
<li>Media Service Zawada sp. z o.o. stosuje odpowiednie środki bezpieczeństwa w celu ochrony danych przed nieupoważnionym dostępem, nieupoważnioną zmianą, ujawnieniem lub zniszczeniem. Zaliczają się do nich wewnętrzne kontrole zebranych danych, procedury przechowywania i przetwarzania oraz środki bezpieczeństwa, w tym odpowiednie algorytmy szyfrowania i fizyczne środki bezpieczeństwa mające na celu ochronę przed nieupoważnionym dostępem do systemów, w których przechowywane są dane osobowe.</li>
<li><span>Polityka plików "cookies"</span>
<ol><li>Poprzez pliki „cookies" należy rozumieć dane informatyczne, w szczególności pliki tekstowe, przechowywane w urządzeniach końcowych użytkowników przeznaczone do korzystania ze stron internetowych. Pliki te pozwalają rozpoznać urządzenie użytkownika i odpowiednio wyświetlić stronę internetową dostosowaną do jego indywidualnych preferencji. „Cookies" zazwyczaj zawierają nazwę strony internetowej z której pochodzą, czas przechowywania ich na urządzeniu końcowym oraz unikalny numer.</li>
<li>Pliki „cookies" używane są w celu dostosowania zawartości stron internetowych do preferencji użytkownika oraz optymalizacji korzystania ze stron internetowych. Używane są również w celu tworzenia anonimowych, zagregowanych statystyk, które pomagają zrozumieć w jaki sposób użytkownik korzysta ze stron internetowych co umożliwia ulepszanie ich struktury i zawartości, z wyłączeniem personalnej identyfikacji użytkownika.</li>
<li>Stosowane są dwa rodzaje plików „cookies" – „sesyjne" oraz „stałe". Pierwsze z nich są plikami tymczasowymi, które pozostają na urządzeniu użytkownika, aż do wylogowania ze strony internetowej lub wyłączenia oprogramowania (przeglądarki internetowej). „Stałe" pliki pozostają na urządzeniu użytkownika przez czas określony w parametrach plików „cookies" albo do momentu ich ręcznego usunięcia przez użytkownika. Pliki „cookies" wykorzystywane przez partnerów operatora strony internetowej, w tym w szczególności użytkowników strony internetowej, podlegają ich własnej polityce prywatności.</li>
<li>Dane osobowe gromadzone przy użyciu plików „cookies" mogą być zbierane wyłącznie w celu wykonywania określonych funkcji na rzecz użytkownika. Takie dane są zaszyfrowane w sposób uniemożliwiający dostęp do nich osobom nieuprawnionym.</li>
</ol><p><strong>Administrator przekazuje Użytkownikowi portalu, którego dane przetwarza, dodatkowo poniższe informacje: </strong></p>
</li>
<li><strong>Kontakt z Inspektorem Ochrony Danych: </strong>
<p>tel.:48 22 870 53 43 , email: <a href="mailto:pkoc@msz.com.pl.pl">pkoc@msz.com.pl.pl</a></p>
</li>
<li><strong>Cel przetwarzania</strong>:<strong> </strong>organizacja i przeprowadzenie konkursów organizowanych przez Administratora; obejmuje to konkursy ogłaszane w czasopismach oraz na stronie WWW Administratora; o ile zostanie udzielona zgoda dane mogą być przetwarzane w celach marketingowych. Przekazane dane mają umożliwić przekazanie nagród laureatom,</li>
<li><strong>Podstawa prawna przetwarzanych danych : </strong>dane są przetwarzane w oparciu:
<p>a/ o <strong>udzieloną zgodę</strong> (rodzica albo opiekuna prawnego) tj. art. 6 ust. 1 lit. b,</p>
<p>b/ na podstawie art. 6 ust. 1 lit. f. RODO, kiedy dane przetwarzane są na potrzeby konkursów a nie będzie konieczna zgoda rodzica/opiekuna prawnego</p>
<p>i zachodzi niezbędność przetwarzania do celów wynikających z prawnie uzasadnionych interesów realizowanych przez administratora lub przez stronę trzecią,</p>
<p>c/ na podstawie art. 6 ust. 1 lit. f. RODO w przypadku marketingu bezpośredniego tj. kiedy zachodzi niezbędność przetwarzania do celów wynikających z prawnie uzasadnionych interesów realizowanych przez administratora lub przez stronę trzecią i nie zachodzi konieczność uzyskania zgody uprawnionego.</p>
</li>
<li><strong>Czas przetwarzania danych:</strong> dane będą przetwarzane, w zależności, który okres będzie dłuższy: a/ zrealizowania celu, w jakim były zbierane i przetwarzane, tj. do momentu zakończenia poszczególnego konkursu tj. wybrania laureatów, b/ upływu okresu zgłaszania reklamacji przez uczestników, określonych w regulaminie konkursu lub przepisów prawa, w tym dot. konsumentów, c/ w przypadku laureatów, którzy otrzymali nagrody, przez okres jaki jest niezbędny do przekazania nagrody i upływu okresu zgłaszania reklamacji określonych w regulaminie konkursu lub przepisów prawa, w tym dotyczących konsumentów albo do upływu okresu wynikającego z przepisów prawa podatkowego.</li>
<li><strong>Odbiorcy danych: </strong>w określonych przypadkach np. wykonywanie czynności na potrzeby marketingu bezpośredniego, dane osobowe mogą być przekazywane do osób trzecich, tj. podmiotów, których przedmiotem działalności są działania marketingowe. W takim przypadku dane będą przekazywane w oparciu o umowę, która będzie spełniać wymagania RODO, w tym zawierać zobowiązanie takiego podmiotu do zachowania tajemnicy.</li>
<li><strong>Przysługujące prawa:</strong> Użytkownik portalu (uczestnik konkursów) udostępniający dane, ma wynikające z RODO następujące prawa:
<p>a/ prawo do żądania od administratora dostępu do treści swoich danych – art. 15,</p>
<p>b/ prawo do sprostowania danych – art. 16,</p>
<p>c/ prawo do usunięcia danych, „<strong>prawo do bycia zapomnianym"</strong> - art. 17,</p>
<p>d/ prawo do ograniczenia przetwarzania -art. 18,</p>
<p>e/ prawo do wniesienia sprzeciwu wobec przetwarzania, w przypadku marketingu bezpośredniego - art. 21,</p>
<p>f/ prawo do przenoszenia danych – art. 20,</p>
<p>g/ prawo wniesienia skargi do organu nadzorczego - art. 77,</p>
<p>h/ kiedy przetwarzanie odbywa się na podstawie zgody, prawo do <strong>cofnięcia zgody</strong> w dowolnym momencie, przy czym pozostaje to bez wpływu na zgodność z prawem przetwarzania, którego dokonano na podstawie zgody przed jej cofnięciem.</p>
<p><span>UWAGA: udostępniający ma prawo do wycofania zgody w sposób według własnego wyboru, w sposób, który nie będzie dla niego uciążliwy i co będzie dla niego równie łatwe jak i wyrażenia zgody. Wycofać zgodę można w szczególności przesyłając swoje żądanie na adres poczty elektronicznej Administratora</span>: <a href="mailto:kontakt@msz.com.pl">kontakt@msz.com.pl</a></p>
</li>
<li><strong>Charakter podania danych: </strong>uczestnik konkursu, chcąc w nim uczestniczyć podaje<strong> dane dobrowolnie. </strong></li>
</ol>', 1),
(5, 'FAQ', 'faq', '<h1>FAQ</h1><h3>Najczęściej zadawane pytania</h3>
<p> </p>
<ol><li><strong>Konkursy nie działają lub nie działają poprawnie.</strong><br />
	Jeśli zauważyłeś, że konkursy nie działają poprawnie lub w ogóle nie startują, upewnij się, czy masz dostęp do szerokopasmowego Internetu o prędkości min. 512 Kbit, czy Twój komputer ma 1GB RAM pamięci lub więcej i procesor 1GHz lub więcej, oraz czy korzystasz z następujących przeglądarek: Mozilla Firefox wersja 17.0 lub wyższa, Google Chrome wersja 23. lub wyższa, Internet Explorer wersja 9. lub wyższa, Safari wersja 5. lub wyższa. Sprawdź też, czy masz zainstalowany Flash Player.
<p>	 </p></li>
<li><strong>Niektóre wyniki wyglądają na nierealne.</strong><br />
	Ranking konkursu jest weryfikowany na bieżąco podczas trwania konkursu, jak również zaraz po jego zakończeniu, tuż przed przyznaniem nagród. Organizator usuwa z konkursu Użytkowników w przypadku uzasadnionego podejrzenia o oszustwo.
<p>	 </p></li>
<li><strong>Otrzymałem/am informację o tym, że moje dziecko zarejestrowało się w waszym serwisie. Nie życzę sobie tego. / Mój adres mailowy został wykorzystany do stworzenia konta bez mojej zgody. Jak usunąć konto w serwisie konkursiaki.pl?</strong><br />
	Usunięcie konta w serwisie konkursiaki.pl jest bardzo proste. Należy się zalogować w serwisie i w zakładce Moje konto wybrać Mój profil. Następnie po kliknięciu przycisku Edytuj profil przejdziemy do formularza edycji profilu, na samym dole znajduje się przycisk Anuluj konto.
<p>	 </p></li>
<li><strong>Podczas rejestracji podałem adres korespondencyjny, który uległ zmianie.</strong><br />
	W każdej chwili możesz zmienić adres poprzez edycję profilu w zakładce Moje konto. Ponadto w przypadku wygranej w konkursie każdorazowo otrzymasz e-mail, za pomocą którego będziesz mógł potwierdzić adres lub dokonać zmiany.
<p>	 </p></li>
<li><strong>Czym różnią się odznaki od rangi użytkownika?</strong><br />
	Odznaki przyznawane są Użytkownikom za określoną częstotliwość poszczególnych aktywności. Ranga użytkownika świadczy natomiast o liczbie zdobytych punktów, którymi premiujemy poszczególne aktywności. Więcej na temat odznak oraz rangi użytkownika można znaleźć w <a href="16" target="_blank">regulaminie serwisu</a>.
<p>	 </p></li>
<li><strong>Co dają mi punkty w rankingu serwisu?</strong><br />
	Punkty w rankingu świadczą o zaangażowaniu Użytkownika. Najaktywniejsi i najbardziej utytułowani Użytkownicy będą nagradzani. Więcej na temat punktacji w rankingu można znaleźć w<a href="16" target="_blank"> regulaminie serwisu</a>.<br />
	 </li>
<li><strong>Nie otrzymałam/em jeszcze nagrody.</strong><br />
	Nagrody przyznane w konkursach organizowanych w ramach serwisu wysyłane są pocztą – przesyłką pocztową w terminie 6 tygodni od momentu opublikowania listy laureatów w serwisie. Wysłanie nagrody jest poprzedzone e-mailem od Administratora z prośbą o potwierdzenie adresu, na który ma zostać przesłana nagroda. Jeśli po upływie powyższego terminu nagroda nie dotarła lub jeśli od momentu potwierdzenia adresu uległ on zmianie, prosimy o kontakt z <a href="mailto:kontakt@konkursiaki.pl">kontakt@konkursiaki.pl</a>.
<p>	 </p></li>
<li><strong>Po zakończeniu konkursu byłem wysoko w rankingu, a teraz mnie nie ma.</strong><br />
	Jeśli Twojego wyniku nie ma w rankingu konkursu to znaczy, że zostałeś z niego usunięty ze względu na podejrzenie o oszustwo. Powinieneś/aś otrzymać e-mail z taką informacją. Jeśli go nie otrzymałeś/Aś, sprawdź folder spam w swojej skrzynce lub w programie pocztowym. W celu uzyskania szczegółowych informacji, prosimy o kontakt z <a href="mailto:kontakt@konkursiaki.pl">kontakt@konkursiaki.pl</a>.
<p>	 </p></li>
<li><strong>Jak dodać/zaprosić znajomych?</strong><br />
	Jeśli chcesz do wspólnej zabawy na konkursiaki.pl zaprosić znajomych, którzy jeszcze nie są zarejestrowani w naszym serwisie, możesz skorzystać z formularza Zaproś znajomych. Formularz pojawia się zawsze po zalogowaniu. Możesz skorzystać również z opcji Zaproś znajomych, dostępnej w zakładce Moje konto. Pamiętaj, że każdy znajomy, który zarejestruje się na konkursiaki.pl za sprawą Twojego zaproszenia, to 5 punktów w rankingu dla Ciebie.
<p>	 </p></li>
<li><strong>Jak usunąć znajomych?</strong><br />
	W zakładce Moje konto wybierz opcję Moi znajomi. Przy każdym znajomym jest umieszczony przycisk Usuń znajomego.
<p>	 </p></li>
<li><strong>Jak mogę zmienić swoje dane, zaktualizować swój profil?</strong><br />
	W zakładce Moje konto wybierz opcję Mój profil, wyświetli się strona z informacjami na temat Twojego profilu. Możesz na niej za pomocą przycisku Edytuj profil zmieniać dane dotyczące: adresu zamieszkania, rodzica oraz swojego adresu e-mail.<br />
	W przypadku tego ostatniego musisz podać aktualne hasło. Możesz też zmienić swój awatar poprzez kliknięcie przycisku Edytuj znajdującego się pod awatarem. Jeśli chcesz dodać lub zmienić Ulubione postacie lub Moje zajawki, kliknij przycisk Edytuj znajdujący się obok tych sekcji.
<p>	 </p></li>
<li><strong>Jak uzyskać nowe hasło?</strong><br />
	Jeśli nie pamiętasz swojego hasła i nie możesz zalogować się do serwisu, na stronie logowania kliknij link Nie pamiętasz hasła? Następnie w oknie tekstowym wpisz nazwę użytkownika, czyli nick lub adres e-mail, którego używałeś do zarejestrowania się w serwisie. Na ten adres zostanie wysłana wiadomość z linkiem do strony, na której będziesz mógł utworzyć nowe hasło.<br />
	Jeśli jesteś zalogowany, ale z jakichś powodów chcesz zmienić hasło, w zakładce Moje konto wybierz opcję Mój profil, następnie kliknij Edytuj profil. Wyświetli się formularz, w którym po podaniu obecnego hasła będziesz mógł utworzyć nowe.
<p>	 </p></li>
<li><strong>Dlaczego moje konto zostało zablokowane?</strong><br />
	Istnieją 3 powody, dla których konto w serwisie może zostać zablokowane: 5 razy podano nieprawidłowe hasło lub login, w tym przypadku konto zostanie odblokowane po około 15 minutach, naruszony został jeden z punktów regulaminu serwisu lub konkursu, powstało podejrzenie oszustwa w konkursie. W celu uzyskania szczegółowych informacji, prosimy o kontakt z <a href="mailto:kontakt@konkursiaki.pl">kontakt@konkursiaki.pl</a>.</li>
</ol>', 1),
(6, 'Kontakt', 'kontakt', '<h1>Kontakt</h1><h2>Masz pytania? Napisz do nas:</h2>

<p>(w treści maila podaj swojego nicka)</p>

<p>admin@konkursiaki.pl</p>

<h3>Siedziba firmy:</h3>

<p>Media Service Zawada sp. z o.o.<br />
al. Stan&oacute;w Zjednoczonych 51<br />
04-028 Warszawa<br />
Tel.: +48 22 870 53 43<br />
Fax.: +48 22 870 75 51</p>

<p>wysyłka nagr&oacute;d: <a href="mailto:kontakt@konkursiaki.pl">kontakt@konkursiaki.pl</a></p>

<p>obsługa techniczna: admin@konkursiaki.pl</p>', 1);

TRUNCATE TABLE `score_pointed_activities`;
INSERT INTO `score_pointed_activities` (`id`, `user_id`, `activity_id`, `points`, `given_at`)
VALUES
(1, 1, 1, 5, '2018-01-31 00:00:00'),
(2, 1, 2, 1, '2018-02-01 00:00:00'),
(3, 2, 3, 5, '2018-01-31 00:00:00'),
(4, 2, 4, 5, '2018-01-31 00:00:00'),
(5, 2, 5, 1, '2018-01-31 00:00:00');

TRUNCATE TABLE `score_games`;
INSERT INTO `score_games` (`id`, `user_id`, `contest_id`, `level`, `begins_at`, `ends_at`, `points`, `points_total`) VALUES
	(1, 1, 1,   1, '2012-10-03 19:44:24', '2012-10-03 19:54:24', 5, 5),
	(2, 1, 1,   2, '2012-09-20 17:06:07', '2012-09-20 17:16:07', 7, 12),
	(3, 2, 2,   1, '2012-09-12 13:03:53', '2012-09-12 13:13:53', 4, 4),
	(4, 3, 2,   1, '2012-09-07 13:05:01', '2012-09-07 13:08:01', 8, 8),
	(5, 3, 1,   1, '2012-09-20 10:52:29', '2012-09-20 10:59:29', 2, 2),
	(6, 3, 1,   2, '2012-09-20 15:31:22', '2012-09-20 15:36:22', 15, 17),
	(7, 3, 3,   1, '2012-09-20 15:31:20', '2012-09-20 15:41:20', 6, 6),
	(8, 4, 3,   1, '2012-09-20 15:39:27', '2012-09-20 15:59:27', 5, 5),
	(9, 5, 3,   1, '2014-10-01 12:02:06', '2014-10-01 12:06:06', 24, 24),
	(10, 6, 3,  1, '2012-12-31 16:42:50', '2012-12-31 16:49:50', 1, 1),
	(11, 6, 1,  1, '2014-10-01 12:03:06', '2014-10-01 12:06:06', 0, 0),
	(12, 6, 1,  2, '2017-09-30 08:00:39', '2017-09-30 08:10:39', 99, 99),
	(13, 6, 4,  1, '2014-10-01 12:01:06', '2014-10-01 12:06:06', 11, 11),
	(14, 7, 4,  1, '2014-10-01 12:03:06', '2014-10-01 12:06:06', 14, 14),
	(15, 7, 5,  1, '2012-12-31 16:20:29', '2012-12-31 16:50:29', 25, 25),
	(16, 8, 6,  1, '2015-08-04 15:14:58', '2015-08-04 15:34:58', 44, 44),
	(17, 9, 6,  1, '2012-12-31 16:10:41', '2012-12-31 16:50:41', 29, 29),
	(18, 10, 1, 1, '2014-10-01 12:03:06', '2014-10-01 12:06:06', 12, 12),
	(19, 10, 2, 1, '2014-10-01 12:03:06', '2014-10-01 12:06:06', 11, 11),
	(20, 10, 3, 1, '2012-12-31 16:21:15', '2012-12-31 16:51:15', 18, 18),
	(21, 10, 4, 1, '2012-12-31 16:41:36', '2012-12-31 16:51:36', 17, 17),
	(22, 10, 5, 1, '2017-08-02 18:35:29', '2017-08-02 18:36:29', 22, 22),
	(23, 10, 6, 1, '2017-08-02 18:34:18', '2017-08-02 18:36:18', 16, 16),
	(24, 10, 6, 2, '2015-09-21 11:41:46', '2015-09-21 11:42:46', 54, 70),
	(25, 10, 6, 3, '2014-03-26 13:32:57', '2014-03-26 13:37:57', 30, 100);

TRUNCATE TABLE def_contest_places;
INSERT INTO `def_contest_places` (`id`, `contest_type_id`, `name`, `place`, `points`) VALUES
	(232, 1, NULL, 1, 100),
	(233, 1, NULL, 2, 99),
	(234, 1, NULL, 3, 98),
	(235, 1, NULL, 4, 97),
	(236, 1, NULL, 5, 96),
	(237, 1, NULL, 6, 95),
	(238, 1, NULL, 7, 94),
	(239, 1, NULL, 8, 93),
	(240, 1, NULL, 9, 92),
	(241, 1, NULL, 10, 91),
	(242, 1, NULL, 11, 90),
	(243, 1, NULL, 12, 89),
	(244, 1, NULL, 13, 88),
	(245, 1, NULL, 14, 87),
	(246, 1, NULL, 15, 86),
	(247, 1, NULL, 16, 85),
	(248, 1, NULL, 17, 84),
	(249, 1, NULL, 18, 83),
	(250, 1, NULL, 19, 82),
	(251, 1, NULL, 20, 81),
	(252, 1, NULL, 21, 80),
	(253, 1, NULL, 22, 79),
	(254, 1, NULL, 23, 78),
	(255, 1, NULL, 24, 77),
	(256, 1, NULL, 25, 76),
	(257, 1, NULL, 26, 75),
	(258, 1, NULL, 27, 74),
	(259, 1, NULL, 28, 73),
	(260, 1, NULL, 29, 72),
	(261, 1, NULL, 30, 71),
	(262, 1, NULL, 31, 70),
	(263, 1, NULL, 32, 69),
	(264, 1, NULL, 33, 68),
	(265, 1, NULL, 34, 67),
	(266, 1, NULL, 35, 66),
	(267, 1, NULL, 36, 65),
	(268, 1, NULL, 37, 64),
	(269, 1, NULL, 38, 63),
	(270, 1, NULL, 39, 62),
	(271, 1, NULL, 40, 61),
	(272, 1, NULL, 41, 60),
	(273, 1, NULL, 42, 59),
	(274, 1, NULL, 43, 58),
	(275, 1, NULL, 44, 57),
	(276, 1, NULL, 45, 56),
	(277, 1, NULL, 46, 55),
	(278, 1, NULL, 47, 54),
	(279, 1, NULL, 48, 53),
	(280, 1, NULL, 49, 52),
	(281, 1, NULL, 50, 51),
	(282, 1, NULL, 51, 50),
	(283, 1, NULL, 52, 49),
	(284, 1, NULL, 53, 48),
	(285, 1, NULL, 54, 47),
	(286, 1, NULL, 55, 46),
	(287, 1, NULL, 56, 45),
	(288, 1, NULL, 57, 44),
	(289, 1, NULL, 58, 43),
	(290, 1, NULL, 59, 42),
	(291, 1, NULL, 60, 41),
	(292, 1, NULL, 61, 40),
	(293, 1, NULL, 62, 39),
	(294, 1, NULL, 63, 38),
	(295, 1, NULL, 64, 37),
	(296, 1, NULL, 65, 36),
	(297, 1, NULL, 66, 35),
	(298, 1, NULL, 67, 34),
	(299, 1, NULL, 68, 33),
	(300, 1, NULL, 69, 32),
	(301, 1, NULL, 70, 31),
	(302, 1, NULL, 71, 30),
	(303, 1, NULL, 72, 29),
	(304, 1, NULL, 73, 28),
	(305, 1, NULL, 74, 27),
	(306, 1, NULL, 75, 26),
	(307, 1, NULL, 76, 25),
	(308, 1, NULL, 77, 24),
	(309, 1, NULL, 78, 23),
	(310, 1, NULL, 79, 22),
	(311, 1, NULL, 80, 21),
	(312, 1, NULL, 81, 20),
	(313, 1, NULL, 82, 19),
	(314, 1, NULL, 83, 18),
	(315, 1, NULL, 84, 17),
	(316, 1, NULL, 85, 16),
	(317, 1, NULL, 86, 15),
	(318, 1, NULL, 87, 14),
	(319, 1, NULL, 88, 13),
	(320, 1, NULL, 89, 12),
	(321, 1, NULL, 90, 11),
	(322, 1, NULL, 91, 10),
	(323, 1, NULL, 92, 9),
	(324, 1, NULL, 93, 8),
	(325, 1, NULL, 94, 7),
	(326, 1, NULL, 95, 6),
	(327, 1, NULL, 96, 5),
	(328, 1, NULL, 97, 4),
	(329, 1, NULL, 98, 3),
	(330, 1, NULL, 99, 2),
	(331, 1, NULL, 100, 1),
	(359, 2, NULL, 1, 200),
	(360, 2, NULL, 2, 199),
	(361, 2, NULL, 3, 198),
	(362, 2, NULL, 4, 197),
	(363, 2, NULL, 5, 196),
	(364, 2, NULL, 6, 195),
	(365, 2, NULL, 7, 194),
	(366, 2, NULL, 8, 193),
	(367, 2, NULL, 9, 192),
	(368, 2, NULL, 10, 191),
	(369, 2, NULL, 11, 190),
	(370, 2, NULL, 12, 189),
	(371, 2, NULL, 13, 188),
	(372, 2, NULL, 14, 187),
	(373, 2, NULL, 15, 186),
	(374, 2, NULL, 16, 185),
	(375, 2, NULL, 17, 184),
	(376, 2, NULL, 18, 183),
	(377, 2, NULL, 19, 182),
	(378, 2, NULL, 20, 181),
	(379, 2, NULL, 21, 180),
	(380, 2, NULL, 22, 179),
	(381, 2, NULL, 23, 178),
	(382, 2, NULL, 24, 177),
	(383, 2, NULL, 25, 176),
	(384, 2, NULL, 26, 175),
	(385, 2, NULL, 27, 174),
	(386, 2, NULL, 28, 173),
	(387, 2, NULL, 29, 172),
	(388, 2, NULL, 30, 171),
	(389, 2, NULL, 31, 170),
	(390, 2, NULL, 32, 169),
	(391, 2, NULL, 33, 168),
	(392, 2, NULL, 34, 167),
	(393, 2, NULL, 35, 166),
	(394, 2, NULL, 36, 165),
	(395, 2, NULL, 37, 164),
	(396, 2, NULL, 38, 163),
	(397, 2, NULL, 39, 162),
	(398, 2, NULL, 40, 161),
	(399, 2, NULL, 41, 160),
	(400, 2, NULL, 42, 159),
	(401, 2, NULL, 43, 158),
	(402, 2, NULL, 44, 157),
	(403, 2, NULL, 45, 156),
	(404, 2, NULL, 46, 155),
	(405, 2, NULL, 47, 154),
	(406, 2, NULL, 48, 153),
	(407, 2, NULL, 49, 152),
	(408, 2, NULL, 50, 151),
	(409, 2, NULL, 51, 150),
	(410, 2, NULL, 52, 149),
	(411, 2, NULL, 53, 148),
	(412, 2, NULL, 54, 147),
	(413, 2, NULL, 55, 146),
	(414, 2, NULL, 56, 145),
	(415, 2, NULL, 57, 144),
	(416, 2, NULL, 58, 143),
	(417, 2, NULL, 59, 142),
	(418, 2, NULL, 60, 141),
	(419, 2, NULL, 61, 140),
	(420, 2, NULL, 62, 139),
	(421, 2, NULL, 63, 138),
	(422, 2, NULL, 64, 137),
	(423, 2, NULL, 65, 136),
	(424, 2, NULL, 66, 135),
	(425, 2, NULL, 67, 134),
	(426, 2, NULL, 68, 133),
	(427, 2, NULL, 69, 132),
	(428, 2, NULL, 70, 131),
	(429, 2, NULL, 71, 130),
	(430, 2, NULL, 72, 129),
	(431, 2, NULL, 73, 128),
	(432, 2, NULL, 74, 127),
	(433, 2, NULL, 75, 126),
	(434, 2, NULL, 76, 125),
	(435, 2, NULL, 77, 124),
	(436, 2, NULL, 78, 123),
	(437, 2, NULL, 79, 122),
	(438, 2, NULL, 80, 121),
	(439, 2, NULL, 81, 120),
	(440, 2, NULL, 82, 119),
	(441, 2, NULL, 83, 118),
	(442, 2, NULL, 84, 117),
	(443, 2, NULL, 85, 116),
	(444, 2, NULL, 86, 115),
	(445, 2, NULL, 87, 114),
	(446, 2, NULL, 88, 113),
	(447, 2, NULL, 89, 112),
	(448, 2, NULL, 90, 111),
	(449, 2, NULL, 91, 110),
	(450, 2, NULL, 92, 109),
	(451, 2, NULL, 93, 108),
	(452, 2, NULL, 94, 107),
	(453, 2, NULL, 95, 106),
	(454, 2, NULL, 96, 105),
	(455, 2, NULL, 97, 104),
	(456, 2, NULL, 98, 103),
	(457, 2, NULL, 99, 102),
	(458, 2, NULL, 100, 101),
	(459, 2, NULL, 101, 100),
	(460, 2, NULL, 102, 99),
	(461, 2, NULL, 103, 98),
	(462, 2, NULL, 104, 97),
	(463, 2, NULL, 105, 96),
	(464, 2, NULL, 106, 95),
	(465, 2, NULL, 107, 94),
	(466, 2, NULL, 108, 93),
	(467, 2, NULL, 109, 92),
	(468, 2, NULL, 110, 91),
	(469, 2, NULL, 111, 90),
	(470, 2, NULL, 112, 89),
	(471, 2, NULL, 113, 88),
	(472, 2, NULL, 114, 87),
	(473, 2, NULL, 115, 86),
	(474, 2, NULL, 116, 85),
	(475, 2, NULL, 117, 84),
	(476, 2, NULL, 118, 83),
	(477, 2, NULL, 119, 82),
	(478, 2, NULL, 120, 81),
	(479, 2, NULL, 121, 80),
	(480, 2, NULL, 122, 79),
	(481, 2, NULL, 123, 78),
	(482, 2, NULL, 124, 77),
	(483, 2, NULL, 125, 76),
	(484, 2, NULL, 126, 75),
	(485, 2, NULL, 127, 74),
	(486, 2, NULL, 128, 73),
	(487, 2, NULL, 129, 72),
	(488, 2, NULL, 130, 71),
	(489, 2, NULL, 131, 70),
	(490, 2, NULL, 132, 69),
	(491, 2, NULL, 133, 68),
	(492, 2, NULL, 134, 67),
	(493, 2, NULL, 135, 66),
	(494, 2, NULL, 136, 65),
	(495, 2, NULL, 137, 64),
	(496, 2, NULL, 138, 63),
	(497, 2, NULL, 139, 62),
	(498, 2, NULL, 140, 61),
	(499, 2, NULL, 141, 60),
	(500, 2, NULL, 142, 59),
	(501, 2, NULL, 143, 58),
	(502, 2, NULL, 144, 57),
	(503, 2, NULL, 145, 56),
	(504, 2, NULL, 146, 55),
	(505, 2, NULL, 147, 54),
	(506, 2, NULL, 148, 53),
	(507, 2, NULL, 149, 52),
	(508, 2, NULL, 150, 51),
	(509, 2, NULL, 151, 50),
	(510, 2, NULL, 152, 49),
	(511, 2, NULL, 153, 48),
	(512, 2, NULL, 154, 47),
	(513, 2, NULL, 155, 46),
	(514, 2, NULL, 156, 45),
	(515, 2, NULL, 157, 44),
	(516, 2, NULL, 158, 43),
	(517, 2, NULL, 159, 42),
	(518, 2, NULL, 160, 41),
	(519, 2, NULL, 161, 40),
	(520, 2, NULL, 162, 39),
	(521, 2, NULL, 163, 38),
	(522, 2, NULL, 164, 37),
	(523, 2, NULL, 165, 36),
	(524, 2, NULL, 166, 35),
	(525, 2, NULL, 167, 34),
	(526, 2, NULL, 168, 33),
	(527, 2, NULL, 169, 32),
	(528, 2, NULL, 170, 31),
	(529, 2, NULL, 171, 30),
	(530, 2, NULL, 172, 29),
	(531, 2, NULL, 173, 28),
	(532, 2, NULL, 174, 27),
	(533, 2, NULL, 175, 26),
	(534, 2, NULL, 176, 25),
	(535, 2, NULL, 177, 24),
	(536, 2, NULL, 178, 23),
	(537, 2, NULL, 179, 22),
	(538, 2, NULL, 180, 21),
	(539, 2, NULL, 181, 20),
	(540, 2, NULL, 182, 19),
	(541, 2, NULL, 183, 18),
	(542, 2, NULL, 184, 17),
	(543, 2, NULL, 185, 16),
	(544, 2, NULL, 186, 15),
	(545, 2, NULL, 187, 14),
	(546, 2, NULL, 188, 13),
	(547, 2, NULL, 189, 12),
	(548, 2, NULL, 190, 11),
	(549, 2, NULL, 191, 10),
	(550, 2, NULL, 192, 9),
	(551, 2, NULL, 193, 8),
	(552, 2, NULL, 194, 7),
	(553, 2, NULL, 195, 6),
	(554, 2, NULL, 196, 5),
	(555, 2, NULL, 197, 4),
	(556, 2, NULL, 198, 3),
	(557, 2, NULL, 199, 2),
	(558, 2, NULL, 200, 1);


TRUNCATE TABLE `score_contests`;
/*
CALL `sp_contests_ending`(1,1);
CALL `sp_contests_ending`(2,1);
CALL `sp_contests_ending`(3,1);
*/

TRUNCATE TABLE _user_badges;
INSERT INTO `_user_badges` (`id`, `user_id`, `badge_id`, `given_at`) VALUES
	(6, 2, 1, '2015-01-14 00:00:00'),
	(8, 2, 3, '2016-01-12 00:00:00'),
	(10, 2, 5, '2016-04-17 00:00:00'),
	(11, 3, 1, '2015-03-29 00:00:00'),
	(12, 3, 2, '2016-04-22 00:00:00'),
	(13, 3, 3, '2016-10-27 00:00:00'),
	(14, 3, 4, '2016-03-13 00:00:00'),
	(15, 3, 5, '2015-07-09 00:00:00'),
	(16, 6, 1, '2016-01-02 00:00:00'),
	(17, 6, 2, '2016-06-16 00:00:00'),
	(18, 6, 3, '2015-04-13 00:00:00'),
	(19, 6, 4, '2016-01-12 00:00:00'),
	(20, 6, 5, '2015-04-25 00:00:00'),
	(21, 8, 1, '2015-06-22 00:00:00'),
	(22, 8, 2, '2016-06-02 00:00:00'),
	(23, 8, 3, '2016-09-06 00:00:00'),
	(24, 8, 4, '2015-02-27 00:00:00'),
	(25, 8, 5, '2016-09-28 00:00:00'),
	(26, 5, 1, '2015-03-28 00:00:00'),
	(27, 5, 2, '2016-12-13 00:00:00'),
	(28, 5, 3, '2016-01-21 00:00:00'),
	(29, 5, 4, '2016-06-02 00:00:00'),
	(30, 5, 5, '2016-12-05 00:00:00'),
	(31, 4, 1, '2016-05-21 00:00:00'),
	(32, 4, 2, '2016-02-26 00:00:00'),
	(33, 4, 3, '2016-08-10 00:00:00'),
	(34, 4, 4, '2015-08-02 00:00:00'),
	(35, 4, 5, '2015-02-03 00:00:00'),
	(36, 7, 1, '2015-09-14 00:00:00'),
	(37, 7, 2, '2016-03-29 00:00:00'),
	(38, 7, 3, '2015-02-06 00:00:00'),
	(39, 7, 4, '2015-10-08 00:00:00'),
	(40, 7, 5, '2016-07-19 00:00:00'),
	(41, 1, 1, '2016-06-10 00:00:00'),
	(43, 1, 3, '2015-06-17 00:00:00'),
	(44, 1, 4, '2015-08-17 00:00:00'),
	(45, 1, 5, '2016-10-01 00:00:00'),
	(46, 9, 1, '2015-11-18 00:00:00'),
	(47, 9, 2, '2016-02-23 00:00:00'),
	(48, 9, 3, '2016-02-04 00:00:00'),
	(49, 9, 4, '2015-01-11 00:00:00'),
	(50, 9, 5, '2015-11-10 00:00:00'),
	(65, 2, 2, '2015-08-27 00:00:00'),
	(66, 3, 2, '2015-02-23 00:00:00'),
	(67, 4, 2, '2015-10-10 00:00:00'),
	(68, 5, 2, '2016-06-04 00:00:00'),
	(69, 6, 2, '2015-10-24 00:00:00'),
	(70, 7, 2, '2016-10-11 00:00:00'),
	(71, 8, 2, '2015-06-19 00:00:00'),
	(80, 2, 2, '2016-07-06 00:00:00'),
	(81, 3, 2, '2015-08-18 00:00:00'),
	(82, 4, 2, '2015-08-06 00:00:00'),
	(83, 5, 2, '2016-02-05 00:00:00');

SET FOREIGN_KEY_CHECKS = 1;
SELECT 1;
