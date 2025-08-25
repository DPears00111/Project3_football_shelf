CREATE SCHEMA `shelf_db` ;
use shelf_db;

-- Create leagues table
CREATE TABLE leagues (
  league_id INT AUTO_INCREMENT PRIMARY KEY,
  league_name VARCHAR(255) NOT NULL UNIQUE
);

-- Create teams table
CREATE TABLE teams (
  team_id INT AUTO_INCREMENT PRIMARY KEY,
  team_name VARCHAR(255) NOT NULL UNIQUE,
  league_id INT,
  FOREIGN KEY (league_id) REFERENCES leagues(league_id)
);

-- Create jerseys table with foreign keys
CREATE TABLE jerseys (
  jersey_id INT PRIMARY KEY,
  team_id INT,
  jersey_name VARCHAR(255),
  img_url_home VARCHAR(1265),
  img_url_away VARCHAR(1265),
  price DECIMAL(10,2),
  FOREIGN KEY (team_id) REFERENCES teams(team_id)
);

-- Insert into leagues
INSERT INTO leagues (league_id, league_name) VALUES (1, 'Premier League');
INSERT INTO leagues (league_id, league_name) VALUES (2, 'Spanish League');
INSERT INTO leagues (league_id, league_name) VALUES (3, 'Bunesliga');
INSERT INTO leagues (league_id, league_name) VALUES (4, 'Series A (Italian League)');
INSERT INTO leagues (league_id, league_name) VALUES (5, 'Lique 1');

-- Insert into teams
INSERT INTO teams (team_id, team_name, league_id) VALUES (1, 'Liverpool FC', 1);
INSERT INTO teams (team_id, team_name, league_id) VALUES (2, 'Leeds United FC', 1);
INSERT INTO teams (team_id, team_name, league_id) VALUES (3, 'Manchester United FC', 1);
INSERT INTO teams (team_id, team_name, league_id) VALUES (4, 'Newcastle United FC', 1);
INSERT INTO teams (team_id, team_name, league_id) VALUES (5, 'Nottingham Forest FC', 1);
INSERT INTO teams (team_id, team_name, league_id) VALUES (6, 'Arsenal FC', 1);
INSERT INTO teams (team_id, team_name, league_id) VALUES (7, 'Aston Villa FC', 1);
INSERT INTO teams (team_id, team_name, league_id) VALUES (8, 'Fullham FC', 1);
INSERT INTO teams (team_id, team_name, league_id) VALUES (9, 'Brighten & Hove Albion FC', 1);
INSERT INTO teams (team_id, team_name, league_id) VALUES (10, 'Chelsea FC', 1);
INSERT INTO teams (team_id, team_name, league_id) VALUES (11, 'Tottenham Hotspur FC', 1);
INSERT INTO teams (team_id, team_name, league_id) VALUES (12, 'Manchester City FC', 1);
INSERT INTO teams (team_id, team_name, league_id) VALUES (13, 'Real Madrid FC', 2);
INSERT INTO teams (team_id, team_name, league_id) VALUES (14, 'Sevilla FC', 2);
INSERT INTO teams (team_id, team_name, league_id) VALUES (15, 'Girona FC', 2);
INSERT INTO teams (team_id, team_name, league_id) VALUES (16, 'Atletico Madrid FC', 2);
INSERT INTO teams (team_id, team_name, league_id) VALUES (17, 'Barcelona FC', 2);
INSERT INTO teams (team_id, team_name, league_id) VALUES (18, 'Bayern Munich FC', 3);
INSERT INTO teams (team_id, team_name, league_id) VALUES (19, 'Borussia Dortmund FC', 3);
INSERT INTO teams (team_id, team_name, league_id) VALUES (20, 'RB Leipzig FC ', 3);
INSERT INTO teams (team_id, team_name, league_id) VALUES (21, 'Juventus FC', 4);
INSERT INTO teams (team_id, team_name, league_id) VALUES (22, 'Roma FC ', 4);
INSERT INTO teams (team_id, team_name, league_id) VALUES (23, 'Inter Milan FC', 4);
INSERT INTO teams (team_id, team_name, league_id) VALUES (24, 'AC Milan FC', 4);
INSERT INTO teams (team_id, team_name, league_id) VALUES (25, 'PSG FC', 5);
INSERT INTO teams (team_id, team_name, league_id) VALUES (26, 'Olympique Marseille FC', 5);

-- Insert into jerseys
INSERT INTO jerseys (jersey_id, team_id, jersey_name, img_url_home, img_url_away, price) VALUES (1, 1, NULL, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.adidas.co.za%2FJV6487.html&psig=AOvVaw0uu4pZ463KhbxeL0LZ0IDH&ust=1754636175961000&source=images&cd=vfe&opi=89978449&ved=0CBYQjRxqFwoTCLD4xqOP-I4DFQAAAAAdAAAAABAE', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.footyheadlines.com%2F2024%2F09%2Fliverpool-25-26-home-kit.html&psig=AOvVaw0uu4pZ463KhbxeL0LZ0IDH&ust=1754636175961000&source=images&cd=vfe&opi=89978449&ved=0CBYQjRxqFwoTCLD4xqOP-I4DFQAAAAAdAAAAABAL', 500.00);
INSERT INTO jerseys (jersey_id, team_id, jersey_name, img_url_home, img_url_away, price) VALUES (2, 2, NULL, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.footyheadlines.com%2F2024%2F11%2Fleeds-united-25-26-home-kit.html&psig=AOvVaw3oyYBjV3jkEq2Akg1BgEe-&ust=1754636380920000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCIjnjpGQ-I4DFQAAAAAdAAAAABAE', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.footyheadlines.com%2F2024%2F11%2Fleeds-united-25-26-home-kit.html&psig=AOvVaw3oyYBjV3jkEq2Akg1BgEe-&ust=1754636380920000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCIjnjpGQ-I4DFQAAAAAdAAAAABAK', 350.00);
INSERT INTO jerseys (jersey_id, team_id, jersey_name, img_url_home, img_url_away, price) VALUES (3, 3, NULL, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.sollymsports.com%2Fproduct%2Fadidas-manchester-united-2025-26-home-jersey-mens-copy%2F%3Fsrsltid%3DAfmBOorIipiK-VI0ytvHQAOD-Sd8VsURud7vfCl5300-DwgIAnH6jaxT&psig=AOvVaw0bYC8wLzjwqUf67VQxjMy1&ust=1754636626049000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCPCbwviQ-I4DFQAAAAAdAAAAABAE', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.sportsa.co.za%2Fproducts%2Fadidas-manchester-united-25-26-away-jersey&psig=AOvVaw0bYC8wLzjwqUf67VQxjMy1&ust=1754636626049000&source=images&cd=vfe&opi=89978449&ved=0CBYQjRxqFwoTCPCbwviQ-I4DFQAAAAAdAAAAABAK', 400.00);
INSERT INTO jerseys (jersey_id, team_id, jersey_name, img_url_home, img_url_away, price) VALUES (4, 4, NULL, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.adidas.co.za%2FJI7382.html&psig=AOvVaw0TXoaAXt8j4vzZmJu0ye43&ust=1754636695814000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCMix252R-I4DFQAAAAAdAAAAABAE', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.adidas.co.za%2FJJ2245.html&psig=AOvVaw0TXoaAXt8j4vzZmJu0ye43&ust=1754636695814000&source=images&cd=vfe&opi=89978449&ved=0CBYQjRxqFwoTCMix252R-I4DFQAAAAAdAAAAABAK', 500.00);
INSERT INTO jerseys (jersey_id, team_id, jersey_name, img_url_home, img_url_away, price) VALUES (5, 5, NULL, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.kickoffshopper.com%2Fproduct%2Fnottingham-forest-home-jersey-25-26%2F%3Fsrsltid%3DAfmBOopm5hLCsAwGNWAZzgnT1PpQXCIxUoHyhvRN7UP7TfMM8X9O0haX&psig=AOvVaw0oDPxmmvwG6wsynf7nN2rr&ust=1754636764579000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCKj6_72R-I4DFQAAAAAdAAAAABAL', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.footyheadlines.com%2F2025%2F01%2Fnottingham-forest-25-26-away-kit.html&psig=AOvVaw0oDPxmmvwG6wsynf7nN2rr&ust=1754636764579000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCKj6_72R-I4DFQAAAAAdAAAAABAS', 250.00);
INSERT INTO jerseys (jersey_id, team_id, jersey_name, img_url_home, img_url_away, price) VALUES (6, 6, NULL, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.adidas.co.za%2FJI9517.html&psig=AOvVaw2PjWnGF06lKSE91vZqfxQp&ust=1754636989343000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCPCm1aWS-I4DFQAAAAAdAAAAABAE', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.adidas.co.za%2FJI9556.html&psig=AOvVaw2PjWnGF06lKSE91vZqfxQp&ust=1754636989343000&source=images&cd=vfe&opi=89978449&ved=0CBYQjRxqFwoTCPCm1aWS-I4DFQAAAAAdAAAAABAK', 500.00);
INSERT INTO jerseys (jersey_id, team_id, jersey_name, img_url_home, img_url_away, price) VALUES (7, 7, NULL, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.footyheadlines.com%2F2024%2F11%2Faston-villa-25-26-home-kit.html&psig=AOvVaw2bHxV43W39fvGGD26qUkYC&ust=1754637042016000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCMDu6NCS-I4DFQAAAAAdAAAAABAE', 'https://www.google.com/imgres?q=Aston%20Villa%20mens%20adidas%20home%20and%20away%20jersey%2025%2F26&imgurl=https%3A%2F%2Fassets.adidas.com%2Fimages%2Fw_1880%2Cf_auto%2Cq_auto%2F48c84f1cc1df4c5db23f11bffe4aeb89_9366%2FJN8053_01_laydown.jpg&imgrefurl=https%3A%2F%2Fwww.adidas.co.za%2FJN8053.html&docid=xhWP-DQ4mzjn7M&tbnid=PHPi9Tr8KVXMLM&vet=12ahUKEwi3uI66kviOAxUMQUEAHacOHxYQM3oECBcQAA..i&w=1880&h=1880&hcb=2&ved=2ahUKEwi3uI66kviOAxUMQUEAHacOHxYQM3oECBcQAA', 400.00);
INSERT INTO jerseys (jersey_id, team_id, jersey_name, img_url_home, img_url_away, price) VALUES (8, 8, NULL, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.footyheadlines.com%2F2024%2F12%2Ffulham-25-26-home-kit.html&psig=AOvVaw0PhRaANmLFgQfxbD5ZoELU&ust=1754637140432000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCLj6556T-I4DFQAAAAAdAAAAABAE', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.footyheadlines.com%2F2024%2F12%2Ffulham-25-26-home-kit.html&psig=AOvVaw0PhRaANmLFgQfxbD5ZoELU&ust=1754637140432000&source=images&cd=vfe&opi=89978449&ved=0CBYQjRxqFwoTCLj6556T-I4DFQAAAAAdAAAAABAJ', 350.00);
INSERT INTO jerseys (jersey_id, team_id, jersey_name, img_url_home, img_url_away, price) VALUES (9, 9, NULL, 'https://www.google.com/imgres?q=Brighten%20%26%20Hove%20Albion%20mens%20nike%20home%20and%20away%20jersey%2025%2F26&imgurl=https%3A%2F%2Fshop.brightonandhovealbion.com%2Fsiteimg%2Fprodhires%2F6699-505.jpg&imgrefurl=https%3A%2F%2Fshop.brightonandhovealbion.com%2Fkit%2Fhome-kit%2Fadult%2F6699_bhafc-adult-2526-home-shirt.html&docid=aPcnjp886ro7_M&tbnid=fRbzjmmveJWeoM&vet=12ahUKEwiTw_Hok_iOAxVUVkEAHZBdBQ4QM3oECBkQAA..i&w=1500&h=1500&hcb=2&ved=2ahUKEwiTw_Hok_iOAxVUVkEAHZBdBQ4QM3oECBkQAA', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.footyheadlines.com%2F2025%2F07%2Fbrighton-25-26-away-kit.html&psig=AOvVaw13ahVlx4qFF3K4AU7Q3K7Y&ust=1754637407618000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCKCPnfuT-I4DFQAAAAAdAAAAABAE', 500.00);
INSERT INTO jerseys (jersey_id, team_id, jersey_name, img_url_home, img_url_away, price) VALUES (10, 10, NULL, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.sportsmanswarehouse.co.za%2Fproduct%2Fchelsea-men-s-home-25-26-soccer-jersey%2F%3Fsrsltid%3DAfmBOophHjp9kzYwpUhazhTPCr4sPHs5VXzW9zUzUhylMVtfg43y2-Cu&psig=AOvVaw1EU3WB9SIEHtWVl2CKDl1g&ust=1754637466293000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCJjW-IiU-I4DFQAAAAAdAAAAABAE', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.sportsmanswarehouse.co.za%2Fproduct%2Fchelsea-men-s-away-25-26-soccer-jersey%2F%3Fsrsltid%3DAfmBOorx5U3_-9B8VBvLG7FVRAqkAvIcW3GAAUiLrBpY1710hZHDWjxc&psig=AOvVaw1EU3WB9SIEHtWVl2CKDl1g&ust=1754637466293000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCJjW-IiU-I4DFQAAAAAdAAAAABAJ', 450.00);
INSERT INTO jerseys (jersey_id, team_id, jersey_name, img_url_home, img_url_away, price) VALUES (11, 11, NULL, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.sportsmanswarehouse.co.za%2Fproduct%2Ftottenham-hotspur-men-s-home-25-26-soccer-jersey%2F%3Fsrsltid%3DAfmBOoq5_clnbMHZ9gZkcuWOReJ6to9aLpYvdnT0c53J7K67fzquK6Y7&psig=AOvVaw1qN3Qp2rQUcpzS4xKdVU31&ust=1754637513033000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCLCF16mU-I4DFQAAAAAdAAAAABAE', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.nike.com%2Fza%2Ft%2Ftottenham-hotspur-2025-26-match-away-dri-fit-adv-football-authentic-shirt-S8K002&psig=AOvVaw1qN3Qp2rQUcpzS4xKdVU31&ust=1754637513033000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCLCF16mU-I4DFQAAAAAdAAAAABAJ', 250.00);
INSERT INTO jerseys (jersey_id, team_id, jersey_name, img_url_home, img_url_away, price) VALUES (12, 12, NULL, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fsoccerwearhouse.com%2Ffr-fr%2Fproducts%2Fpuma-manchester-city-25-26-authentic-home-jersey%3Fsrsltid%3DAfmBOorcYAYI4q4nr1Lw05RrUPVkinCpNvRgQSoazDlwd7mfzHs0qR6r&psig=AOvVaw2i-CGd67-8jWDnI7MSxtNb&ust=1754637602291000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCMC-8syU-I4DFQAAAAAdAAAAABAE', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.sollymsports.com%2Fproduct%2Fpuma-manchester-city-2024-25-away-jersey-mens%2F%3Fsrsltid%3DAfmBOordSMI2kzC9nRpWeB86HDiTu7wb84iEIqIKyPeciCvrgM8eMp86&psig=AOvVaw2i-CGd67-8jWDnI7MSxtNb&ust=1754637602291000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCMC-8syU-I4DFQAAAAAdAAAAABAL', 500.00);
INSERT INTO jerseys (jersey_id, team_id, jersey_name, img_url_home, img_url_away, price) VALUES (13, 13, NULL, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.footyheadlines.com%2F2024%2F09%2Freal-madrid-25-26-home-kit.html&psig=AOvVaw0mHB7DfVzeaYNUVnBiHdCU&ust=1754637711315000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCKCCuf6U-I4DFQAAAAAdAAAAABAK', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.adidas.co.za%2FJJ4182.html&psig=AOvVaw0mHB7DfVzeaYNUVnBiHdCU&ust=1754637711315000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCKCCuf6U-I4DFQAAAAAdAAAAABAE', 550.00);
INSERT INTO jerseys (jersey_id, team_id, jersey_name, img_url_home, img_url_away, price) VALUES (14, 14, NULL, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fshop.sevillafc.es%2Fen%2Fproducts%2Fcamiseta-adulto-paseo-sevilla-fc-25-26-roja%3Fsrsltid%3DAfmBOoqgo5KdTmFHhpf6oTguQKYxKoSiNxTM3MjmUmCr2tJ67qXduxPP&psig=AOvVaw2uwf59eKDhuW7-EyYY0JSy&ust=1754637812425000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCID_17aV-I4DFQAAAAAdAAAAABAE', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fshop.sevillafc.es%2Fen%2Fproducts%2Fcamiseta-adulto-paseo-sevilla-fc-25-26-blanca%3Fsrsltid%3DAfmBOoo-qQJcTzJcqcQAGw5qwIh54YBZ-odwpOvEO3MCLgU0mXKDiseN&psig=AOvVaw2uwf59eKDhuW7-EyYY0JSy&ust=1754637812425000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCID_17aV-I4DFQAAAAAdAAAAABAL', 300.00);
INSERT INTO jerseys (jersey_id, team_id, jersey_name, img_url_home, img_url_away, price) VALUES (15, 15, NULL, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fuk.puma.com%2Fuk%2Fen%2Fpd%2Fgirona-fc-25-26-away-jersey-men%2F783025&psig=AOvVaw1NbzIpOe8KuqR4rB7nKWSt&ust=1754637885732000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCPiRr9mV-I4DFQAAAAAdAAAAABAJ', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.footyheadlines.com%2F2025%2F05%2Fgirona-25-26-kits.html&psig=AOvVaw1NbzIpOe8KuqR4rB7nKWSt&ust=1754637885732000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCPiRr9mV-I4DFQAAAAAdAAAAABAE', 450.00);
INSERT INTO jerseys (jersey_id, team_id, jersey_name, img_url_home, img_url_away, price) VALUES (16, 16, NULL, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fthirdcoastsoccer.net%2Fproducts%2Fnike-atletico-madrid-home-jersey-25-26%3Fsrsltid%3DAfmBOooZbknUCjSNfOUWbaANZ4pbPajUv8G3KekjFlnBvZydAelgrWVz&psig=AOvVaw0US1_PvDTYr_l-IWmeSein&ust=1754637978934000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCNioq_6V-I4DFQAAAAAdAAAAABAK', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fshop.atleticodemadrid.com%2Fen%2Fmen%2527s-away-player-edition-25-26-jersey%2FHJ4423-425.html&psig=AOvVaw0US1_PvDTYr_l-IWmeSein&ust=1754637978934000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCNioq_6V-I4DFQAAAAAdAAAAABAE', 200.00);
INSERT INTO jerseys (jersey_id, team_id, jersey_name, img_url_home, img_url_away, price) VALUES (17, 17, NULL, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.footyheadlines.com%2F2024%2F09%2Fbarcelona-25-26-home-kit.html&psig=AOvVaw2j3g3grEqizl93o_fKjUdy&ust=1754638152307000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCJjL39GW-I4DFQAAAAAdAAAAABAE', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.footyheadlines.com%2F2024%2F11%2Ffc-barcelona-25-26-away-kit.html&psig=AOvVaw2j3g3grEqizl93o_fKjUdy&ust=1754638152307000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCJjL39GW-I4DFQAAAAAdAAAAABAJ', 350.00);
INSERT INTO jerseys (jersey_id, team_id, jersey_name, img_url_home, img_url_away, price) VALUES (18, 18, NULL, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.adidas.co.za%2FJJ2137.html&psig=AOvVaw3EB9RzUWCQM6ewGi6Cn51h&ust=1754638215629000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCOjtgYqX-I4DFQAAAAAdAAAAABAE', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.adidas.co.za%2FJJ2143.html&psig=AOvVaw3EB9RzUWCQM6ewGi6Cn51h&ust=1754638215629000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCOjtgYqX-I4DFQAAAAAdAAAAABAK', 400.00);
INSERT INTO jerseys (jersey_id, team_id, jersey_name, img_url_home, img_url_away, price) VALUES (19, 19, NULL, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.sportsa.co.za%2Fproducts%2Fpuma-bvb-home-jersey-2024-25&psig=AOvVaw0kAzRf_HQi4P0w5KBC7KzA&ust=1754638345560000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCPDaw7KX-I4DFQAAAAAdAAAAABAf', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.footyheadlines.com%2F2025%2F05%2Fdormund-25-26-third-kit.html&psig=AOvVaw0kAzRf_HQi4P0w5KBC7KzA&ust=1754638345560000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCPDaw7KX-I4DFQAAAAAdAAAAABAY', 500.00);
INSERT INTO jerseys (jersey_id, team_id, jersey_name, img_url_home, img_url_away, price) VALUES (20, 20, NULL, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.footyheadlines.com%2F2025%2F03%2Fleipzig-25-26-home-kit.html&psig=AOvVaw1GTQ1ikKCLovc9A0TafaDD&ust=1754638493881000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCND0nIyY-I4DFQAAAAAdAAAAABAK', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.redbullshop.com%2Fen-int%2Fp%2FMen%2FRBL-PUMA-Away-Jersey-25-26%2FRBL25010%2F%3Fsrsltid%3DAfmBOoraVvteZcEo9dxuyNwgaVzspFE7iJLReQKCB6jVbAsl588SGSf-&psig=AOvVaw1GTQ1ikKCLovc9A0TafaDD&ust=1754638493881000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCND0nIyY-I4DFQAAAAAdAAAAABAE', 240.00);
INSERT INTO jerseys (jersey_id, team_id, jersey_name, img_url_home, img_url_away, price) VALUES (21, 21, NULL, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.adidas.co.za%2FJJ4314.html&psig=AOvVaw1YeBV9A4fQuP_lEBtbEgj2&ust=1754638638627000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCKD-l7iY-I4DFQAAAAAdAAAAABAE', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fstore.juventus.com%2Fgb%2Fjuventus-away-jersey-2025-26%3Fsrsltid%3DAfmBOorx0MWCTV6fxx9GG87BEZWTcESFouOdxRdE4h-2Cow2C79GJh28&psig=AOvVaw1YeBV9A4fQuP_lEBtbEgj2&ust=1754638638627000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCKD-l7iY-I4DFQAAAAAdAAAAABAL', 200.00);
INSERT INTO jerseys (jersey_id, team_id, jersey_name, img_url_home, img_url_away, price) VALUES (22, 22, NULL, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.adidas.ae%2Fen%2Fas-roma-25-26-home-jersey%2FJP4184.html&psig=AOvVaw2C1PdqOOYlm4ovWxfggREa&ust=1754638703051000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCOD8-daY-I4DFQAAAAAdAAAAABAE', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.wegotsoccer.com%2Fitem%2Fadidas-as-roma-2024-25-away-jersey%2Fw36162%2Ftee%3Fsrsltid%3DAfmBOoojLfPBGE81CrOxK8H-lQjGsgzaRT28HS6n-BBl6A_iko7H5Cb_&psig=AOvVaw2C1PdqOOYlm4ovWxfggREa&ust=1754638703051000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCOD8-daY-I4DFQAAAAAdAAAAABAR', 350.00);
INSERT INTO jerseys (jersey_id, team_id, jersey_name, img_url_home, img_url_away, price) VALUES (23, 23, NULL, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.footyheadlines.com%2F2024%2F09%2Finter-milan-25-26-home-kit.html&psig=AOvVaw0V-JgckgUXNpBfRjPGfMMX&ust=1754638787926000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCKi6qoOZ-I4DFQAAAAAdAAAAABAK', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fsoccermaxx.ca%2Fproducts%2Fnike-inter-milan-fc-25-26-mens-stadium-away-jersey%3Fsrsltid%3DAfmBOooqL7bWozxQHtBh9kB4zzgQfLXfzjft6sJCtWtnTNC8hRNz0VL4&psig=AOvVaw0V-JgckgUXNpBfRjPGfMMX&ust=1754638787926000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCKi6qoOZ-I4DFQAAAAAdAAAAABAR', 460.00);
INSERT INTO jerseys (jersey_id, team_id, jersey_name, img_url_home, img_url_away, price) VALUES (24, 24, NULL, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.sollymsports.com%2Fproduct%2Fpuma-ac-milan-2024-25-home-jersey-mens%2F%3Fsrsltid%3DAfmBOoo4_g-4VwxEDZ4P6iMaVnyDQMAKYJgJGnfvi9y_ez2S3Jl9COfC&psig=AOvVaw158znX8g8OAlc7d2Nbjyvq&ust=1754639099167000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCMDu2pOa-I4DFQAAAAAdAAAAABAE', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fza.puma.com%2Fpd%2Fac-milan-25-26-away-jersey-men%2F779971.html&psig=AOvVaw158znX8g8OAlc7d2Nbjyvq&ust=1754639099167000&source=images&cd=vfe&opi=89978449&ved=0CBYQjRxqFwoTCMDu2pOa-I4DFQAAAAAdAAAAABAR', 500.00);
INSERT INTO jerseys (jersey_id, team_id, jersey_name, img_url_home, img_url_away, price) VALUES (25, 25, NULL, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.footyheadlines.com%2F2024%2F08%2Fpsg-25-26-home-kit.html&psig=AOvVaw1mtQYXNkP0Ozyd3a0ab54h&ust=1754638931278000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCJDg2sOZ-I4DFQAAAAAdAAAAABAE', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.footyheadlines.com%2F2024%2F08%2Fpsg-25-26-home-kit.html&psig=AOvVaw1mtQYXNkP0Ozyd3a0ab54h&ust=1754638931278000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCJDg2sOZ-I4DFQAAAAAdAAAAABAE', 600.00);
INSERT INTO jerseys (jersey_id, team_id, jersey_name, img_url_home, img_url_away, price) VALUES (26, 26, NULL, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.footyheadlines.com%2F2025%2F04%2Fmarseille-25-26-home-kit.html&psig=AOvVaw27VcpdB51CNKYhDFupt9gT&ust=1754639285340000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCODd1u2a-I4DFQAAAAAdAAAAABAE', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fboutique.om.fr%2Fen%2Fom-away-shirt-25-26-ome25mahrext.html%3Fsrsltid%3DAfmBOooYPXYwZTQnCD97g3yWbFv6ZVY0ra5u-IgSgA2gmZ9u84QMAQlS&psig=AOvVaw27VcpdB51CNKYhDFupt9gT&ust=1754639285340000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCODd1u2a-I4DFQAAAAAdAAAAABAL', 150.00);

--create cart table
CREATE TABLE `cart` (
  `product_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `price_at_add` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  CONSTRAINT `jersey_id` FOREIGN KEY (`product_id`) REFERENCES `jerseys` (`jersey_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_id` FOREIGN KEY (`product_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
);


--create users table
CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
);
