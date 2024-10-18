-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2024 at 04:59 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `datasecure_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `image_id` int(11) NOT NULL,
  `encryption_key` text DEFAULT NULL,
  `storage_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`image_id`, `encryption_key`, `storage_url`) VALUES
(19, 'kwoP9zjdtP1vWO9bzQMAKjR1IH2lMTV5aDrM+DSv7Aj5RbkI0jp0ltpokB/Vhz1GBvayQBBIM8bMBJlPnyYbmeMyNl7uPJBotGb144SGVj/Og0ZCVhkYy8TluWZVcVQ/KmLRMe+fMAi0pq4lJORzFyoBKNsCyfOyqiLawM1pKQqK7/1M2buOYnXD/Ql8lVpFiuXNyo52efA2ddacAJTlwvbH3dd7JzIyGhinEo8Kr7pRTR8lnQcmwI+Lo1TU9DSC3y4HWqHAoa+Yn6FiMf3uaskhl2kGNUseZLYPZAI+uMZ8s5D8OAUqcMMbqqNkATjgyyKpuuxgwuBtVHVSuHs2WA==', 'uploads/19_6106456.png.bin'),
(21, 'Kd9teqI7w5BlIdPEZJ3zMzuKYwKyo4rPg8fTvp7ikKAcCf8JvHqfsZb50Ui0W2n8ykAGkNfJ1kr3FNtVhq+ZyneWDDEix/WP5otOF6cWWOy/5idWzsW2ecNGMP/5dbMeF0lWVz6FAPXF5GcR5lAFF4ppd9RrKInUCSf4glU2FW5uwJbk0NwxWMhjMXwHugKFmgBwdMQcYhRxkuHdFEgoxhFIti//GVqZP8Plz4YDZCGEoK5k81+okziXKC2K312JJeHDL2x0ana7Ls2nlfpqBjq/eBbSPvYg6bMXh3sXwmL/T/6QnnxOhFlYqvbGarKJuZUltq+Lwpvn5i8vNYU2VA==', 'uploads/21_6sc1tk146m461.jpg.bin'),
(22, 'N1FysbRaaIWBl4jdicZNX7p2Aj0TQNfO0qrFMusc/oQobn+cpHZ+1wg+JIvAqpaMzEP5wy9IQmFmL3MEy+BaVk2oyqwGNrrpIheSTeoL/kOwcmqfo+3HrmJqCGWS7xO03FLcJ+Y3W+aas9CVEw4XvVJ8mbhT6DGp/uUgsaneb7aQy7sdZB2H+g2XOe+xnpIf81e4yhZEJ6G2kpg5L/RnB40wC5aEDzVO6zlGd7z3QtPO4W1LjB943bPp6xaPQcwkHHO2nxVtbP9uulAmPOslqcNepkOmr6Un821EVnSMOVpN7ea5Nf/OXVu0qvQknpBZHRwDtJm7hIr/B5YxH43PLQ==', 'uploads/22_Figure_2.png.bin'),
(23, 'JEBVKa/t6LkVC/XPS1ELmVMr0XejYhQFCuyCOmHsCKNAh1BseTMC8h/za+59jpIHwDlrOQKKr654XGmYrtbOIuDfMQ7nnmXuOBS351lDm+80S6o92V7/oY/l32+sDbLeQXou+s8OORPeWpQHeihcjvOtDgg7H1BsrHaTdxy7rQxXFBvnE7dLA5e7dxwu37ppCgch1UIJaQhBKr3Rz39EPxQ+WtjuJUKnGPQHf+pfZ7J3/Cd6eWQ7ANKOwbTl2PZUVF2tGjUQS8TbNcHWwEXyzs8rJmTdlQzXDxSC3UgMwEFv8l8vooIb86BtjmRF/lqdsy/tt33jeuTsuF4DEOUPDw==', 'uploads/23_10 by 10 orthogonal maze.png.bin'),
(24, 'QpS6TOuRrQMTYL4VuB7S7XaPNP8K8wiQCkjtE/uh8r9MG+srW257pwUpoe9ASAESmsavdPMZ1qTAj1m3SY+cvgmHIvMDYz8+ozJ8DO6IKFMMy6gRkvc+hOtQrrMXsAsJ05yZkt2AMoYUOfkYX4UwcDuKtO2TM+A79pGFIoA19604XppWOqW128DCoWs+aLLJJfAUXTjn7S9/3Iz6IUY8+YPNBn1bT7Y2JD9GdPARz5MGyAKS42ycQigJEYlh5Rzna/qN9WdAbrJvl9ckHwF6CfLdZE7btmiGSTkGL87RNxbSa8JFLH2LtcaEJKU47VWt6InyjJ65Jq2RCDGC0ZeuCQ==', 'uploads/24_9374926.png.bin'),
(25, 'Rap6cjzgHuIZwpeiXhm9jXFXhgGSbc585L+MaQfSo1mhQ4sL0rOWY4WAU3edU5eBFduSxewAlP3h3Wm+ou2SXxcr8ZEA7diShaCIfDav3JiH/yQbKYjF+7OXkJEVkL5QUz4PuhpttXXgukyvn9TQscZ7grb22Wi4zE7WmmFvg+8IFh3D0cTOF8tjE/Dz9hNF7ZPHv1otNoFVpptauxya1J3+LxWdHcBEWAaLXmjncChSvhzHpJtRJO1BQT80zlfVkiYZbE2tJ3OY5HRp1IMNTuYKSf0RVe9K6W4PvLZcNzE671g8pkYysvTc7TNRPqGjA5knZFLB8Zq3ncn7x7CFTQ==', 'uploads/25_9374926.png.bin'),
(26, 'HlSqxNboj4h8HeBZhwUSGL9c0fb3bh2l9Ms47S3+I5Y4F0W/6Es+P1TgZHe/wtzLieQtYHr6zHQtmOZKJIvtJmLdeGqL2ADPTfG/laxde4+PMzUgBXkGo+9FlBtg7wP+MinwzUk6g5KaxUHp42IZ4HNZU0tzekNYUw+P5JkTajd+e9ZvZAssbuoG5Krt+Ji0Ul5NXgu7zUkJnVGIMN9c7ElJE4xdIi72mmns00yRgtdJBluHcN6MlZDzQqxf+yhuRmzX/NCAIG33ldaslH/+o5teUOm+Kd7oHmQHWvMWgTwqJcOk87VkX12Ga3EAtl4PT5vdfgmjsp6mr/DPW+3xlw==', 'uploads/26_20 by 20 orthogonal maze (1).png.bin'),
(27, 'ZKzqUEvzIbB8581l95CwSTWF29Svdxi/MH5iLMhojfMOPEalysELjmvxFnf2TUeuok0E9FzSx+U9q8JdhPkPnD8JDjsDssgvI99TCID9tYhZ/0TT7mFZVueg5lTt5p4aUgSHZC/vObQafcAOBL9JtA6wMYRipP8a7uIFfU9x6q1g/57wEUGtL4haP9zj4VH+zI3XZ2lMKfjrnMM5rpZtLYVBRm2mzPTy31571VtWmralrdcqP1xKgOA/J2SWI2IuXGh0vYfk5rp0+tvnvhVIahTxlX+BA1gzj5P71XHM5ROZfoIkZMkkVRd4fYThwDm1H9av+toqLkun7MW+Z4WJDA==', 'uploads/27_9374926.png.bin'),
(28, 'str7hAfJO/kI62+3Q1U0TdUPdN9iy2ScXrTBosubn5U1XOiMQ2gT/7lXs1CEO2irxx82ucV3RflvG+K3ydWqd6CRQqg6pTnuxc3Zq2MdwYmQZfnYeuur8t9wQmGzLrPLQNk8HEKACNqR6mALy3nIHDbomdQIKRa4KQlEpdAsDcx7GPAuqjzk+2WKiRiYl8yQW6BMtfDZ090eT7clZN992NoCfdGQuPZMstFCRTat0syW65KsCBKFAuRIcK37AoViLiqOBzuaYu7E3NQPZW75b2ev4y4iLUrioJ5kMKuQpP5sFL4bRcrXH2v3HEUXdGCAs4yAgmbaIYfBw5EyzhWfFg==', 'uploads/28_3.jpg.bin'),
(29, 'dccoqCVZtp8FWqRlytdR4z1883XOTv+QiBT6rivCbRNmKW4xtRbsrLHiuyyKhhotRlBfsCxf16ROGxfGK0TzN080k7uef4UtWtzKgbuOUCcce6FrLY3TeFu10zjubfVKHp2Ile91+/nF9o9PY++n4M+GJYxLXwVzWm4GbhYDnIkPqeYkrzAqu6FajIkMSGFLz0x2m+bdw/aotuFN/eY21k+KE8mpYnjM03K9jDpRjDv3IVgOx3Zf8wgFTxWM+I467KYUmQEpoRhwyUhYP4MyGy70ORbsr2+YKs035OJ/UALpnaP6MKKCu3ccB5VAKzhqX1wwMrlEoWK7PuVP/N+HEA==', 'uploads/29_9374926.png.bin'),
(30, 'COrV5omsem1UG3YEJtUb83my6uIraWS1E2FtZfgxOQ1nUApcW7yZr5F41zyoE3joscCcRH0mggGzi0OUvbZgrZKbE69KeLus3hfjJOjlQoB/P/DXtqnCxnaemimUaw0TWXTgf3glqXR83e99CuKf6utj+uADBMqmh3GBNsgkHP840LUw96Nh1rig0353eiuhb5qUqU8CTMqrkyS3donf5b//YES1nw+w7iv9NXStpWPb2u31VPdOFa9asBrVuescUbBE8D72rNDx7YOfF/qzj4u7Jp8oZVjhhuCAUpJlbhGfUgu+PPlcgOoEiylBbT0DaUYuQHfEjETUhYih86unDw==', 'uploads/30_9374926.png.bin'),
(31, 'DepUG+NzPsWvkAfu2ASARZjTBB/4+cKbXhjxOPUg04QhFmvITbyuBZ86SDXrsKE0r3Z26CzOnhCSWceO/McPkTH2v3QLjlpPWkeRnAX7skBQqD3RfnKYg/fOPnTSffVUpUB+MhFL7Ap7dTXvj8bE24gzpzTzJVlS039HWEmfY3WWZNg2zUvXywQn2sTWB75xV8XfcluxtZdX1RqyRli8ZAi/gHNb8iHXXJ53+APVMLdiXqJ8jRw5vy7TXTxvy3kv2RzZ0fxsXjEYzjkY9C8zu0cX8D0iDwIZqLZS9Bi6khsVFi0HxunJYC7FX4amX51uzi3gxG3hGay4z8R+d2KgSw==', 'uploads/31_Figure_1.png.bin'),
(32, 'jM29j4ig1dfWUg6+qFEBLfFfN1yGwENAih4avJkLZzbRUUgq0gEekabp9NJN7QSgiN6+hOEUib7pXCXSEEEeUm+I04sb4t84U35HiGLtxCjMtvTm8r3SazdqprhIDtsqD5x9OGJTFrlSgVw/Ft+lyd+sRckwI+Rn8dW8V3wq5RoJIQRRZcciedFFP67JktzMs3EiYDPVlbeB97BXw+YtZ8X63lIrcxiY9iMVQXp7RKg2BhSXpYEmf4DhMuWu7ZV66hPtILeOH2zRCc233nPGNdhcsu+JU3m339Gu7ZMKbKfjzrJBK6Gxl/MhaZlRgbfQGnEj9W0vktVBpNfUMq38sg==', 'uploads/32_71153220_2423209797968868_472816822014443520_n.jpg.bin'),
(33, 'DAQqQqCRa3ef3O6ZkUtC3fOLaXxVgoGmk+AWn4RqBZ5roDVx1sKcnnUGO5WdZvKmPDTvIUR/mY1FoOnB+Vrzwb8/ZwiuVwjfw5lmeGzojA1HfOjKUpbnG/MwgJOdKIEUZiWaUqOrOzdZVt4SIbX1c0CuRDSw0yKjqMjIFzos6tS6QP/GYhW6v7wnW+avODiH7LESItYx1uf10cz6Sfdnukb16sbq3cK4dLlCcDqcIA1SIjUxkH18LxiUQ4Q4h7IfkQiVT4QCriQnkNchSTiIM2ENSRPkdvsXVWFu6bjxzx7IeD8AFxsopWxwZ23sPWMEj/5YdyApfQi7YNzVG4ZFlQ==', 'uploads/33_9374926.png.bin'),
(34, 'VPXW9lHpoUeOVHDxyKyMS4ma0aeqigBSFh3lga8SZymIP1RN9hGhKOeV/8A5EfnPgaAMfLTeEl5jpZBs3/euPXfcc8J8+AqO5kR6wa/AQigQ2Ox8VFTytN//hwamZTcIWNO9Tq1Zsf9DN2/R5GcJLTQ3tVWyDpVMRDxIRNWzNlPp8Ksvot1LwogQvpRwDJbm2ntMjIJnlsXO8ZQlfOjuQkHXYqsxnhF74zeHvVW7e28FTMuL8S1pVtvz2WA9eZ9HVzvsWoyxvATv6ZihTRO7uUbbQlBNqTeMyz5GoYfNjMGgSBWYmNGzIR9JiuBKbbyMn5ENuZZsLvyw7nfLQDOCgA==', 'uploads/34_100 by 100 orthogonal maze.png.bin');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `content` text DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  `message_type` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `sender_id`, `receiver_id`, `timestamp`, `content`, `image_id`, `message_type`) VALUES
(9, 7, 8, '2024-10-09 15:50:53', 'สวัสดี', NULL, 0),
(10, 8, 7, '2024-10-09 15:51:16', 'สวีดัส', NULL, 0),
(11, 7, 9, '2024-10-09 16:16:52', 'ทำไรอยู่', NULL, 0),
(13, 7, 8, '2024-10-09 10:24:11', 'ok', NULL, 0),
(21, 8, 9, '2024-10-10 03:37:14', '', 19, 1),
(23, 8, 9, '2024-10-10 03:41:10', '', 21, 1),
(24, 9, 8, '2024-10-10 08:24:43', '', 22, 1),
(25, 8, 9, '2024-10-10 09:00:52', 'สวัสดีครับ', NULL, 0),
(27, 9, 8, '2024-10-10 10:30:06', '', 23, 1),
(28, 9, 8, '2024-10-10 10:42:14', '', 24, 1),
(29, 9, 8, '2024-10-10 10:59:41', '', 25, 1),
(30, 9, 8, '2024-10-10 11:00:02', '', 26, 1),
(31, 9, 8, '2024-10-10 11:01:06', '', 27, 1),
(32, 8, 9, '2024-10-10 13:12:43', 'สวัสดีครับอาจาร', NULL, 0),
(33, 8, 9, '2024-10-10 13:12:45', 'สวัสดีครับอาจาร', NULL, 0),
(34, 8, 7, '2024-10-10 13:13:43', 'ทำไร', NULL, 0),
(35, 8, 7, '2024-10-10 13:16:48', 'ตอบหน่อย', NULL, 0),
(36, 8, 7, '2024-10-10 13:23:09', '', 28, 1),
(37, 8, 7, '2024-10-10 13:23:29', '', 29, 1),
(38, 8, 7, '2024-10-10 13:27:02', 'ตอบหน่อยครับ', NULL, 0),
(39, 8, 9, '2024-10-10 13:37:45', 'ทำไร', NULL, 0),
(40, 9, 8, '2024-10-10 13:47:49', 'กินข้าว', NULL, 0),
(41, 10, 8, '2024-10-10 19:19:08', 'สวัสดี', NULL, 0),
(42, 8, 10, '2024-10-10 19:19:56', '', 30, 1),
(43, 9, 8, '2024-10-18 07:26:32', '', 31, 1),
(44, 8, 9, '2024-10-18 07:36:34', 'สวัสดี', NULL, 0),
(45, 8, 9, '2024-10-18 07:37:18', '', 32, 1),
(46, 8, 9, '2024-10-18 07:39:08', 'ทำไรอยู่', NULL, 0),
(47, 8, 9, '2024-10-18 07:39:15', '', 33, 1),
(48, 8, 9, '2024-10-18 07:42:43', 'กินข้าวยัง', NULL, 0),
(49, 8, 9, '2024-10-18 07:42:54', '', 34, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `public_key` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `password`, `public_key`) VALUES
(7, 'paper', '4ef47dd8aaa341823ef1200072607f1e0a606d6ffcb1015ec076e6dd15d3776c', '-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA05pFYLYvTZ3TC9wGTnOT\nQ2KTCFaJEKMaXtO6yjuIIRv9okotQk8C7IyYw8ElPzhtNS3h3MzfhMEuAruSF3Hf\nY367WUlmPpijZ3OkX1ZOrhDCkCa1q37Le74pyxnoQia8a48NEIOGdGuxzAQTBlIf\nISpqCYF4FVzcEsEFZKkcYqlEP47JDI+xGiOfiIcHnUZQdsQmMjJ9Ba9ECTxTixf/\nRL5kt0HyZrDT/EXhNOQUFJquZZ+8Dik7oypqYavgNeb75TjcMLsDeaRBWuMCicqh\nMp0IyxFnC+IMAHl4JTsBNDZkhhzC+Vd5YwnY6Mv9ay88ecLTculme7QqAtbaTc5m\nbQIDAQAB\n-----END PUBLIC KEY-----\n'),
(8, 'did', '6b898dbae075a35790c6f6244164d065e1fbcad3ec48f7bdda70014c2e8acbd4', '-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAiPreAM4HyMJ4EmdIEPAm\nLhHn67K2UebO18mDeNo6D/C8LbdV0qMOGyZ90RgXknbcDuoMpH1xEo1/kqfFOiGp\nSNzaPAtUoKjEJGNMu5DbxdfMujldaY8Jhf88886UeOWs/3DsEHOU1xKj6rinNUvI\nLc/giKYup6qLKmrelFFcZ6iTG4Tw9vMSZWL0RycfPcZYojbee3V+KqiWetu2n/sd\nVlVG1/SnK2C1NuSPRSxx3Xu+oO66xpT9SvJ0rj4a4vNHPVQ2BSg0fYKIYB+sBQqj\nMrng0vVNp8N5mYcahv5d8D3g3kcY4ASiMN0VmmorUsm8mz3y83kdLin8Vcx0ZqdW\nmQIDAQAB\n-----END PUBLIC KEY-----\n'),
(9, 'best', '20b3df11e7a4a4a6b4e51b874392413ac37411896c6b1957eac94546cf946b5a', '-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAw2cNRGyA9XvxNUGDiXW5\nXOdhMRVtL3yhfz++L4Gy91hP7Ymd4rbmW6t9ia8+bPsIuMpCiNpqD1sFg6c+eXhG\nES9XEJmVTcvjug0mE12YM2cfdBnrasCybdNy7bYavpVP9iuiGOk9kcll44K/NNjc\nf1ftA8ToKiPs6qztHHgSX1bXEK+7Z0oZ4nL+gfZx3AOG6J/HQI0sroCmfwVuaiwC\ngnK68ATqhsMe+0cz3F2UmW2KGI/nxK6ZVbxY2xEAb7etYXjgCH/dJeluLM0ITNfp\nucUXf01sEgPtGQ+7k/fS6tPp3G4wkotSHKKh5Wk22TcZOgHVQuJUJ2BwTbfjZ9Kc\nXQIDAQAB\n-----END PUBLIC KEY-----\n'),
(10, 'Bigshow', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArUXrztOCxV+rxOhHd3M/\n9xmDur9AIooVP8232dWDaWFvFCZKxPFVn0xNXk79Y96oPjImyhjYT+bnuogVNtNm\nF+VVdlh0hqFCfkQ4OBQulmVBAxOnnzd9WeM1p2hXJ+eVYl1v4tzcNc5uAySRsaJ/\n4neLoU4LPIHgGRl1hf8kgCM5fIRZgJTatuF0Sjv14/8Mti0Ay2xKT86EelE/QlFI\nDZq1/mcfNcnX2KgFi47Hz5y6lGqWN4uIv3zthStCaSFgrI5LG8GGqLx54gqxRVC0\no8e5m29S/CXZ+JWvDVYRKOQ/j27VjToZLcuVhTVFttILUiqOQ0tlgmAfW379WaRx\n8wIDAQAB\n-----END PUBLIC KEY-----\n'),
(11, 'keng', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqY2dO9rrtMD1S58bTnOn\nZMN43ZsG39UAzIpfUxHw9e7bpqfToxLBX+soiBg3dXa82ZG+TSVlVl4XzxiIKtXN\nN98wo8gRyQ1O1Z/pinSgItpatVbulBG4grkz3/kgANnW4yhGsp4MpmxC19zKnHbb\nvnVJUVnOtIS0WwkSbrq/6oimDLI9nhw3rgWj0WeTqv9B4J0J/mqj/eh2ZDy6qDdk\nZESP4XBnkGuEZ6PPLPn6vJB26C7MMLFo5cLYdDPeQhSlU7a46xuaf0dz/IPh0ByG\n4k1DMUBmAK28gNmZuxFeKZ1VvPKWo4T88P+/3ktPvaypx92n9rfnH174uvHX+fVk\nXQIDAQAB\n-----END PUBLIC KEY-----\n'),
(12, 'long', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA0eTmxfp/k6GhYgqHDQm/\nHVib68oK6BOyACKyAmqrmVAkdlNoB9nf+0I7MHfV6cBdAkyFezowv4bW0RASOU14\nkdNdAyibxJby3X68t/Zprx7uK42+xHn6wbBGa6yKYMxJy07yoHcX0OoabE9Nh63Q\noRszlgLnFG/y3aSTNmTTrD7bn8w65MhBr1+06XsraU02aTy+XWcWQGhpr3kK2mE9\nhtMcuqkxNVwWr2OPTFmkNXt04dXBjEl2je9eOByZkvrhWG+5xKzJ3S6J4ANVHCuX\nm2xQKbqbgAcLoaOrvZpcQCGeYRStoFM+Fr4c5RAaM5ahxDmwJ1HT9UqPv0AJWB6u\nIwIDAQAB\n-----END PUBLIC KEY-----\n'),
(13, 'poo', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA1vnmVb3aq/D3JAgJImTD\nB3bwFm4kiR07dp1uyqACZzPT013P1sxDf/BKrWvCPQYxj6w6AQ5VV4pvqKDycg9H\nD0OZ+EriUZRzu92QkKbKjE1aKw7yHeix3A79C2E3NduDpUn4aXPABfgcCItX3q0W\nX1oZZ8zd4QoZ0jMI63sv7nzAKCk6KK0NkUBDRSdpEetMII+A2ZVsTk3o4lvrn/0F\n5k6omh5Z+BCdntyoYu7RjF6p199i94nB22cJh9rOzItysB5zQ2bExegJVn8kT/Ji\nvkUdmS7Ds0/asnBPofnphqFqhpByMT+LIymuE6W8CTwrkjHp2qB8DVV4M4uGqs5q\nOwIDAQAB\n-----END PUBLIC KEY-----\n'),
(14, 'mith', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA0+OdRCmOgaSzQEXEMNVA\n7Bhjep6cochCzBfmqLmhZcN4S8ARhKrsW6/Xzf6JeOpC4OzEI2yItdNoJqP1elGi\n2f6GOaZRwbbkdvAOh/cy8U/b8Bd0rdAiybO0MrP1cbIUYF5uOq53nhwvRFjRAPse\nyNKh5y8WzDfGpb04FScjC4hQ/0VibfQx50qr8v1qqFNGgKQFxe/cgjB85ceCJplm\nnluUboI/932LO7UQBeUfQ1ARHOgvpp/pnZLCMNJhlCj2bYA6LrcJaVdzzbgMEOHm\ncNv4GO0FoeARpu4mReP5TTHofgqyVs3gzsS59aAByu+xPfxBvD21UePMsUr1ZIK8\npwIDAQAB\n-----END PUBLIC KEY-----\n'),
(15, 'kengkla', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAydc//Jd+jf6cEvCx81Q1\nwruffg58XjgjUM3dJV5ZyI2V3uY7E3LIZDZ3YcNm7GBfZrsIckF/F+g6wMrXGCPo\nooM/mW5WUepUwJ+5E/9NCaSTl/qJlcx6FpzMRse5rCfofo4jLAghvfbi4q8jXXfY\nGker2ep5YIB+0d61C/6kbo+Xtsxdf8gf4HLShcbtDEfAVsmZyzoVIqkaeyAnfLUV\nbULrrZLMfHgLc0iHHH2X/R3wWkIR0Kqj9g23eq9Yih6mu8CvrWWNzvGYQVc4UTdB\n3vhkxP3S3ZDcf34gxhDEFUHB1B03uvYhvzg8Rug5XTVBz4jdeAp0Ar9ZT0MNcJew\n9wIDAQAB\n-----END PUBLIC KEY-----\n');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`),
  ADD KEY `image_id` (`image_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_ibfk_3` FOREIGN KEY (`image_id`) REFERENCES `images` (`image_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
