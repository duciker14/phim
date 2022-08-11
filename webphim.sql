-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 11, 2022 lúc 11:42 AM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `webphim`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `description`, `status`) VALUES
(3, 'Phim viễn tưởng', 'phim-vien-tuong', 'Danh sách các phim viễn tưởng hay', 1),
(6, 'Phim hoạt hình', 'phim-hoat-hinh', 'Danh sách phim hoạt hình', 1),
(7, 'Phim bộ', 'phim-bo', 'Tuyển tập phim bộ', 1),
(8, 'Phim tình cảm', 'phim-tinh-cam', 'Phim tình cảm hay nhất', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `countries`
--

INSERT INTO `countries` (`id`, `title`, `slug`, `description`, `status`) VALUES
(1, 'Việt Nam', 'viet-nam', 'Phim Việt Nam hay', 1),
(3, 'Thái Lan', 'thai-lan', 'Phim Thái Lan hay', 1),
(4, 'Hàn Quốc', 'han-quoc', 'Phim Hàn Quốc hay', 1),
(5, 'Phim Mỹ', 'phim-my', 'Phim Mỹ hay nhất', 1),
(6, 'Nhật Bản', 'nhat-ban', 'Phim JAV', 1),
(7, 'Trung Quốc', 'trung-quoc', 'Phim Trung Quốc hay nhất', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `episodes`
--

CREATE TABLE `episodes` (
  `id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `linkphim` varchar(255) NOT NULL,
  `episode` int(11) NOT NULL,
  `created_at` varchar(50) NOT NULL,
  `updated_at` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `episodes`
--

INSERT INTO `episodes` (`id`, `movie_id`, `linkphim`, `episode`, `created_at`, `updated_at`) VALUES
(1, 16, '<iframe width=\"100%\" height=\"500\" src=\"https://www.youtube.com/embed/0Fy-IJZOMp0\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 1, '2022-08-10 10:18:34', '2022-08-10 10:18:34'),
(2, 16, '<iframe width=\"100%\" height=\"500\" src=\"https://www.youtube.com/embed/psVrCo1BDSY\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 2, '2022-08-09 17:13:58', '2022-08-09 17:13:58'),
(5, 16, '<iframe width=\"100%\" height=\"500\" src=\"https://www.youtube.com/embed/TJlXGZlh9gU\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 3, '2022-08-10 10:43:48', '2022-08-10 10:43:48'),
(6, 24, '<p><iframe allowfullscreen frameborder=\"0\" src=\"https://short.ink/SdX3fHOz5\" width=\"100%\"></iframe></p>', 1, '2022-08-10 13:44:00', '2022-08-10 13:44:00'),
(7, 13, '<p><iframe allowfullscreen frameborder=\"0\" src=\"https://short.ink/ARmGJ94y1\" width=\"100%\"></iframe></p>', 1, '2022-08-10 13:50:04', '2022-08-10 13:50:04'),
(8, 23, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/O6c93E5j2Bc\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 1, '2022-08-10 13:54:59', '2022-08-10 13:54:59'),
(9, 19, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/bUXN4QTVnDo\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 1, '2022-08-10 13:58:29', '2022-08-10 13:58:29'),
(10, 6, '<p><iframe allowfullscreen frameborder=\"0\" src=\"https://short.ink/T63SDy8D8\" width=\"100%\"></iframe></p>', 1, '2022-08-10 14:07:18', '2022-08-10 14:07:18'),
(11, 21, '<p><iframe allowfullscreen frameborder=\"0\" src=\"https://short.ink/tFlX98sDb\" width=\"100%\"></iframe></p>', 1, '2022-08-10 16:04:58', '2022-08-10 16:04:58'),
(12, 11, '<p><iframe allowfullscreen frameborder=\"0\" src=\"https://short.ink/fbcfW8mv-\" width=\"100%\"></iframe></p>', 1, '2022-08-10 16:08:47', '2022-08-10 16:08:47'),
(13, 5, '<p><iframe allowfullscreen frameborder=\"0\" src=\"https://short.ink/ksAQiG0Adu\" width=\"100%\"></iframe></p>', 1, '2022-08-10 16:44:55', '2022-08-10 16:44:55'),
(14, 5, '<p><iframe allowfullscreen frameborder=\"0\" src=\"https://short.ink/kiATZ8ioe\" width=\"100%\"></iframe></p>', 2, '2022-08-11 09:59:04', '2022-08-11 09:59:04'),
(15, 5, '<p><iframe allowfullscreen frameborder=\"0\" src=\"https://short.ink/Ye_8TjyDeW\" width=\"100%\"></iframe></p>', 3, '2022-08-11 09:59:55', '2022-08-11 09:59:55'),
(16, 5, '<p><iframe allowfullscreen frameborder=\"0\" src=\"https://short.ink/QIxDBQh0p\" width=\"100%\"></iframe></p>', 4, '2022-08-11 10:00:33', '2022-08-11 10:00:33'),
(17, 5, '<p><iframe allowfullscreen frameborder=\"0\" src=\"https://short.ink/sBE1-XWkA\" width=\"100%\"></iframe></p>', 5, '2022-08-11 10:01:15', '2022-08-11 10:01:15'),
(18, 5, '<p><iframe allowfullscreen frameborder=\"0\" src=\"https://short.ink/cV7TeVsHn\" width=\"100%\"></iframe></p>', 6, '2022-08-11 10:01:50', '2022-08-11 10:01:50'),
(19, 5, '<p><iframe allowfullscreen frameborder=\"0\" src=\"https://short.ink/slOPcixCc\" width=\"100%\"></iframe></p>', 7, '2022-08-11 10:02:23', '2022-08-11 10:02:23'),
(20, 5, '<p><iframe allowfullscreen frameborder=\"0\" src=\"https://short.ink/hJKNbuLj9\" width=\"100%\"></iframe></p>', 8, '2022-08-11 10:02:56', '2022-08-11 10:02:56'),
(21, 5, '<p><iframe allowfullscreen frameborder=\"0\" src=\"https://short.ink/t3QICLIO9\" width=\"100%\"></iframe></p>', 9, '2022-08-11 10:03:36', '2022-08-11 10:03:36'),
(22, 5, '<p><iframe allowfullscreen frameborder=\"0\" src=\"https://short.ink/d4M-c1jz3\" width=\"100%\"></iframe></p>', 10, '2022-08-11 10:04:09', '2022-08-11 10:04:09'),
(23, 5, '<p><iframe allowfullscreen frameborder=\"0\" src=\"https://short.ink/FzHdERtuu\" width=\"100%\"></iframe></p>', 11, '2022-08-11 10:04:38', '2022-08-11 10:04:38'),
(24, 5, '<p><iframe allowfullscreen frameborder=\"0\" src=\"https://short.ink/A48KGD31m\" width=\"100%\"></iframe></p>', 12, '2022-08-11 10:05:07', '2022-08-11 10:05:07'),
(25, 5, '<p><iframe allowfullscreen frameborder=\"0\" src=\"https://short.ink/CtmW-8lON\" width=\"100%\"></iframe></p>', 13, '2022-08-11 10:06:49', '2022-08-11 10:06:49'),
(26, 5, '<p><iframe allowfullscreen frameborder=\"0\" src=\"https://short.ink/aiVtbxU4k\" width=\"100%\"></iframe></p>', 14, '2022-08-11 10:07:28', '2022-08-11 10:07:28'),
(27, 5, '<p><iframe allowfullscreen frameborder=\"0\" src=\"https://short.ink/G9OOjNlR9\" width=\"100%\"></iframe></p>', 15, '2022-08-11 10:07:57', '2022-08-11 10:07:57'),
(28, 5, '<p><iframe allowfullscreen frameborder=\"0\" src=\"https://short.ink/byL0Pf3HD\" width=\"100%\"></iframe></p>', 16, '2022-08-11 10:08:30', '2022-08-11 10:08:30'),
(29, 5, '<p><iframe allowfullscreen frameborder=\"0\" src=\"https://short.ink/cYPH86_NM\" width=\"100%\"></iframe></p>', 17, '2022-08-11 10:09:02', '2022-08-11 10:09:02'),
(30, 5, '<p><iframe allowfullscreen frameborder=\"0\" src=\"https://short.ink/BAvHvVL0aK\" width=\"100%\"></iframe></p>', 18, '2022-08-11 10:10:22', '2022-08-11 10:10:22'),
(31, 5, '<p><iframe allowfullscreen frameborder=\"0\" src=\"https://short.ink/_e2ptbDO3\" width=\"100%\"></iframe></p>', 19, '2022-08-11 10:11:19', '2022-08-11 10:11:19'),
(32, 5, '<p><iframe allowfullscreen frameborder=\"0\" src=\"https://short.ink/jUTcOeaM_\" width=\"100%\"></iframe></p>', 20, '2022-08-11 10:12:04', '2022-08-11 10:12:04'),
(33, 12, '<p><iframe allowfullscreen frameborder=\"0\" src=\"https://short.ink/BH3ZsovTV\" width=\"100%\"></iframe></p>', 1, '2022-08-11 10:37:48', '2022-08-11 10:37:48');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `genres`
--

CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `genres`
--

INSERT INTO `genres` (`id`, `title`, `slug`, `description`, `status`) VALUES
(5, 'Phim mới', 'phim-moi', 'Danh sách Phim mới', 1),
(6, 'Phim chiếu rạp', 'phim-chieu-rap', 'Danh sách phim chiếu rạp', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `time` varchar(50) DEFAULT NULL,
  `trailer` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `status` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `phimhot` int(11) NOT NULL,
  `resolution` int(11) NOT NULL DEFAULT 0,
  `phude` int(11) NOT NULL DEFAULT 0,
  `ngaytao` varchar(100) DEFAULT NULL,
  `ngaycapnhat` varchar(100) DEFAULT NULL,
  `year` varchar(20) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `topview` int(11) DEFAULT NULL,
  `season` varchar(100) DEFAULT NULL,
  `sotap` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `movies`
--

INSERT INTO `movies` (`id`, `title`, `time`, `trailer`, `slug`, `description`, `status`, `image`, `category_id`, `genre_id`, `country_id`, `phimhot`, `resolution`, `phude`, `ngaytao`, `ngaycapnhat`, `year`, `tags`, `topview`, `season`, `sotap`) VALUES
(5, 'IRIS-1', '60p/1tap', 'HZn77U-3goE', 'iris-1', 'Kim Hyun Joon bị mất cả cha và mẹ trong một tai nạn giao thông khi còn nhỏ. Trong lúc anh suy sụp nhất thì người bạn Jin Sa Woo ở bên lấp đầy khoảng trống ấy cho anh. Từ đó họ coi nhau như anh em ruột đã thề sẽ luôn tin tưởng nhau và giữ mãi tình bạn không bao giờ thay đổi. \r\nTrong kỳ huấn luyện, 2 người gặp Choi Seung Hee và cả 2 đều có tình cảm với Seung Hee. Cho đến khi 2 người được đưa đến tổ chức tình báo quốc gia (NSS) và trở thành những nhân viên tình báo hàng đầu, họ mới biết Seung Hee chính là nhân viên tình báo được tổ chức phái đi thẩm tra năng lực của họ. \r\nVượt qua những nguyên tắc bất di bất dịch trong ngành tình báo, Hyun Joon và Seung Hee hẹn hò bí mật và còn cùng nhau bí mật đi du lịch ở Nhật. Sau khi quay về Hàn Quốc họ lập tức nhận được nhiệm vụ qua Hungary cùng với Sa Woo. Đến khi họ hoàn thành và tổ chức ăn mừng thì cũng là lúc Hyun Joon nhận được yêu cầu bí mật, phải tách khỏi bạn thân và người yêu.\r\n Từ đó anh bị ngụy tạo thành đã hy sinh trong khi bản thân phải trôi dạt ở một quốc gia lạnh giá khác mà người thân ở nhà không ai hay biết.', 1, 'iris3.jpg', 8, 5, 4, 1, 2, 0, NULL, '2022-08-10 16:42:18', '2012', NULL, NULL, NULL, 20),
(6, 'CHỜ EM ĐẾN NGÀY MAI', '110 phút', 'ElusZEgYGfY', 'cho-em-den-ngay-mai', 'Chờ em đến ngày mai là bộ phim được Đinh Tuấn Vũ chuyển thể từ truyện dài Anh không là con chó của em của đạo diễn Lê Hoàng với phần chắp bút kịch bản của NSƯT Đỗ Đức Thịnh. Đạo diễn Đinh Tuấn Vũ cho biết phim không giống hoàn toàn nguyên tác của Lê Hoàng nhưng những chi tiết đặc sắc vẫn được giữ nguyên. Phim chú trọng vào kỹ xảo cho các cảnh một chú chó biết nói tiếng người.\r\nNội dung câu chuyện xoay quanh nhân vật Ly Cún (An Nguy đóng), là cô gái xinh đẹp, hồn nhiên và làm công việc bán thức ăn nhanh ở một nhà hàng. Sau lần giúp đỡ một bà lão lạ mặt, Ly Cún liên tục trải qua những câu chuyện khó tin của cuộc đời. Phim mang không khí lãng mạn, trẻ trung và niềm tin vào cuộc sống. Đạo diễn muốn đem đến cho khán giả một không gian tươi mới và câu chuyện cảm động về tình yêu của những con người đang tuổi thanh xuân.\r\nMột trong những điều làm nên sức hút của phim là sự xuất hiện của chàng diễn viên, MC đa tài Trấn Thành. Trong phim, anh vào vai ngôi sao điển trai, tài năng Kenny Vũ, yêu cô nàng bán đồ ăn nhanh tên Ly Cún nhưng lại vướng vào quan hệ phức tạp với một cô gái khác (do người mẫu Lilly Nguyễn đóng).\r\n\r\nVới mỗi bộ phim tham gia, Trấn Thành luôn là cái tên mang khán giả đến rạp cũng như giữ họ lại bằng những mảng miếng gây cười. Tuy nhiên, trong Chờ em đến ngày mai, giám khảo của \"Thách thức danh hài\" lại thể hiện được đúng tính cách của ngôi sao ca nhạc với quá khứ là một đứa trẻ mồ côi, được nhận nuôi bởi một gia đình giàu có nhưng luôn thiếu thốn tình cảm.', 1, 'CHOEMDENNGAYMAI83.jpg', 8, 5, 1, 0, 0, 0, NULL, '2022-08-09 10:52:04', '2016', NULL, NULL, NULL, 1),
(10, 'CẬU ÚT CẬU CON CÚC', NULL, 'eI09E8-fYHs', 'cau-ut-cau-con-cuc', 'Câu chuyện kể về Dì Hai - là một người mẹ chờ con gái của mình về ăn Tết. Dì Hai sống cùng với đứa em trai của mình, mọi người hay gọi là Cậu Út (Huỳnh Lập thủ vai). Dì Hai hay gọi Cậu Út là Cậu con Cúc. \r\nTuy vai vế là Cậu, nhưng tâm hồn luôn trẻ trung, năng động và có chút tưng tưng. Với mái tóc thề dài đen mượt, cùng với bộ râu lúng phúng, tạo hình của Cậu Út rất lãng tử nhưng đôi khi cũng không kém phần quyến rũ. \r\nBảo (Duy Khánh thủ vai) vừa xem cậu Út là mẹ, vừa xem là ba, vừa xem cậu Út là Cậu và vừa xem là bạn, vì tuổi của cả hai không quá xa nhau. \r\nVà cuối cùng, Cúc là ai? Cúc có chịu về hay không? Cúc có lí do gì mà không dám về quê 2 năm qua. “Cậu Út Cậu Con Cúc” sẽ cho khán giả câu trả lời, một câu chuyện vừa hài hước, vừa sâu sắc về tình cảm gia đình trong thời buổi dịch bệnh vào dịp Tết.', 1, 'cauutconcaucuc29.PNG', 7, 5, 1, 0, 3, 2, NULL, '2022-08-09 10:52:13', '2018', NULL, NULL, NULL, 1),
(11, 'AVATAR-1', NULL, 'oeRG9A6bDdY', 'avatar-1', 'Avatar là một bộ phim khoa học viễn tưởng của Mỹ năm 2009 do James Cameron viết kịch bản và đạo diễn, với sự tham gia của các diễn viên Sam Worthington, Zoe Saldana, Stephen Lang, Michelle Rodriguez, Joel David Moore, Giovanni Ribisi và Sigourney Weaver. Bộ phim lấy bối cảnh vào năm 2154, khi con người đang khai thác một khoáng vật quý giá gọi là unobtanium tại Pandora, một hành tinh tươi tốt mang sự sống nằm trong chòm sao Alpha Centauri. Việc mở rộng khai thác mỏ tại cụm làng đang đe dọa sự tồn tại của tộc người bản địa Na’vi ở Pandora. Tiêu đề của bộ phim đề cập đến ứng dụng công nghệ gen trong việc lai ADN giữa người Na’vi và người Trái Đất của một nhóm nghiên cứu sự tương tác với người bản địa ở Pandora.\r\n\r\nÝ tưởng về Avatar bắt đầu vào năm 1994, khi Cameron viết 80 trang bản thảo cho bộ phim. Việc quay phim được cho là diễn ra sau khi hoàn thành bộ phim của Cameron năm 1998 – Titanic, và trở thành một kế hoạch được triển khai vào năm 1999, nhưng theo Cameron, những kỹ xảo cần thiết chưa có sẵn để đạt đến những gì ông đã tưởng tượng về bộ phim. Bắt đầu làm việc với ý tưởng về một ngôn ngữ khác của người ngoài hành tinh vào mùa hè năm 2005, Cameron đã tiến đến phát triển kịch bản phim và suy nghĩ về một hành tinh hư cấu vào đầu năm 2006. Avatar chính thức có được dự thảo ngân sách 237 triệu đô la Mỹ. Ước tính khác cho rằng chi phí sản xuất khoảng 280 đến 310 triệu và 150 triệu đô la Mỹ cho quảng bá. Bộ phim đã được trình chiếu dưới dạng xem 2D truyền thống, xem 3D (sử dụng các định dạng RealD 3D, Dolby 3D, XpanD 3D, IMAX 3D) và xem 4D. Việc làm phim nổi được xem là một bước đột phá trong công nghệ điện ảnh.\r\n\r\nNgày 10 tháng 12 năm 2009, Avatar được công chiếu tại Luân Đôn; ngày 16 tháng 12, phát hành quốc tế; ngày 18 tháng 12, công chiếu tại Mỹ và Canada, đồng thời được ca ngợi và tán dương nhiệt liệt. và thành công trong thương mại. Bộ phim đã phá vỡ kỷ lục phòng vé suốt thời gian trình chiếu và trở thành phim có doanh thu cao nhất mọi thời đại tại Mỹ, Canada và trên toàn thế giới, vượt qua Titanic, bộ phim đã giữ kỷ lục suốt 12 năm. Nó cũng trở thành bộ phim đầu tiên kiếm được hơn 2 tỷ đô la. Avatar đã được đề cử 9 giải Oscar, bao gồm Phim xuất sắc nhất, Đạo diễn xuất sắc nhất, và đoạt 3 giải: Quay phim xuất sắc, Hiệu ứng hình ảnh và Chỉ đạo nghệ thuật xuất sắc. Sau thành công của phim, Cameron đã ký hợp đồng với hãng 20th Century Fox để sản xuất hai phần tiếp theo, Avatar trở thành phần đầu trong kế hoạch bộ ba.\r\n\r\nPhiên bản 2D của bộ phim bị cấm chiếu trên toàn lãnh thổ Cộng hoà Nhân dân Trung Hoa vì những lo ngại tình tiết nổi dậy, bạo động trong phim có thể ảnh hưởng đến người dân.', 1, 'avt65.jpg', 3, 6, 5, 1, 0, 0, NULL, '2022-08-09 10:51:48', '2010', NULL, NULL, NULL, 1),
(12, 'Doraemon: Nobita và cuộc chiến vũ trụ – Doraemon: Nobita’s Little Star Wars', '100phut', 'Hv4Az9Ga9KY', 'doraemon-nobita-va-cuoc-chien-vu-tru-–-doraemon-nobita’s-little-star-wars', 'Một tổng thống người ngoài hành tinh tí hon trú ẩn tại nhà Nobitas do chiến tranh giữa các vì sao. Doraemon và băng đảng giúp anh ta bằng cách đánh bại kẻ thù.', 1, 'doremon-nobita-va-ten-doc-tai-vu-tru-doraemon-nobita-no-uchuu-sho-senso-32098-250x35050.jpg', 6, 6, 6, 1, 0, 1, NULL, '2022-08-11 10:37:01', '2014', 'doremon', NULL, NULL, 1),
(13, 'STAR WAR - THẦN LỰC THỨC TỈNH', NULL, 'BEoaXi4BOnk', 'star-war-than-luc-thuc-tinh', 'Phim lấy bối cảnh 30 năm sau sự kiện của Star Wars phần IV – Return of the Jedi (Sự trở lại của Jedi). Bộ phim sẽ theo chân các nhân vật quen thuộc như Luke, Han Solo, Công chúa Leia… đến một hành tinh lạ với mục đích thu thập mẫu vật. Nhưng họ không ngờ mình sắp đánh thức một kẻ thù nguy hiểm bậc nhất vũ trụ hiện đang ngủ yên nơi đây. Star Wars: The Force Awakens sẽ được chỉ đạo bởi một người mới, đạo diễn J.J. Abrams, thay cho người sáng tạo George Lucas, và sẽ mở đầu cho bộ 3 phần phim tiếp theo của loạt phim này.', 1, 'Star_Wars_The_Force_Awakens_727.jpg', 3, 6, 5, 1, 0, 0, NULL, '2022-08-09 13:48:43', '2016', NULL, 2, NULL, 1),
(14, 'KẺ BẮN TỈA: QUẠ TRẮNG', NULL, NULL, 'ke-ban-tia-qua-trang', 'Sau khi hứng chịu thảm kịch dưới bàn tay của những người lính xâm lược ở Donbas, một giáo viên vật lý người Ukraine tìm cách trả thù. Anh ta đặt mục tiêu vào một tay súng bắn tỉa ưu tú của Nga, người mà việc loại bỏ có thể thay đổi cục diện của cuộc xung đột.', 1, '62e238c29d122_bantia-435_62755.jpg', 3, 5, 5, 0, 0, 1, NULL, '2022-08-09 10:51:17', '2018', NULL, NULL, NULL, 1),
(15, 'VUA KHỦNG LONG', NULL, 'lQS9IcOak-U', 'vua-khung-long', 'Trong thời kỳ cuối kỷ Phấn trắng , một Tarbosaurus trẻ tên Junior bị truy đuổi bởi một Tsintaosaurus . May mắn thay, cha anh, Speckles đã có thể giải cứu anh. Speckles đã rất thất vọng tại Junior. Anh ta có thể đã bị giết. Một ngày nọ, khi Speckles đang săn lùng một số Protoceratops , Junior đang cản đường và rơi xuống nước. Anh ta không biết bơi, vì vậy anh ta kêu cứu, mặc dù ở vùng nước nông. Speckles đã rất thất vọng vì Junior nên chuyển đi.\r\n\r\nNgày hôm sau, Junior đang săn một con Pachycephalosaurus , khi một gói Deinonychus bắt cóc anh ta. Speckles đang cố gắng chiến đấu với Deinonychus, sau khi theo dõi họ, cho đến khi họ bật anh ta nhưng cuối cùng lại rơi xuống sông dưới đáy một hẻm núi. Junior thấy mình ở một nơi mà nhiều con khủng long trẻ khác cũng bị bắt cóc. Một Therizinosaurus đang cố gắng tấn công anh ta, nhưng một con Tarbosaurus trẻ tên Blue đã tấn công Therizinosaurus trở lại. Một Carnotaurus , tên là Blade đã nói với cô rằng hãy tránh xa Therizinosaurus. Deinonychus trở lại và đưa ba con khủng long khác ra khỏi mái vòm và khuất tầm nhìn.\r\n\r\nTrong khi đó, Speckles đang tìm kiếm Junior, nhưng không thấy đâu. Anh gặp một Saichania tên Cy. Ông nói rằng ông muốn trả thù cho sự mất mát của một con khủng long mà ông yêu thích. Junior, trong khi đó kết bạn với Blue và gặp một Monoclonius, được gọi là Dusty, trong khi tìm nơi trú ẩn. Trong một hang động, Speckles và Cy bị một số Brontoscorpio dồn vào chân tường . Speckles đã chiến đấu trở lại, nhưng một Brontoscorpio đã ném anh ta. May mắn thay, Speckles đã có thể chiến đấu trở lại.\r\n\r\nTrong khi đó tại mái vòm, Junior, Blue và Dusty bị thu hút bởi thức ăn. Dusty đã cố gắng ăn một số loại cây, nhưng một con Dsungaripterus đã đánh cắp chúng. Speckles và Cy đang trên đường đi thì một cồn cát rung chuyển và cuối cùng họ rơi vào một cái hố tối tăm. Ở đó, họ gặp một Tarbosaurus tên Fang. Speckles và Fang đã chiến đấu trở lại, nhưng Fang nói với anh rằng cô đã cứu mạng anh.\r\n\r\nJunior, Blue và Dusty đang cố gắng đập đá bằng đuôi, nhưng một con Deinonychus đã bắt được chúng và đưa Dusty suốt đường lên mái vòm. Dsungaripterus nói rằng một con quái vật khổng lồ sống trong một hang động nơi một ngọn núi lửa sắp phun trào. Speckles, Fang và Cy gặp một đàn Pukyongosaurus và họ đã ngăn chặn một gói Carnotaurus đánh cắp trứng Pukyongosaurus. Junior nói với Blade để thử và thoát khỏi khu vực này, nên tối hôm đó, Junior đánh lạc hướng Deinonychus, trong khi Blade và Blue ném đá vào họ. Nhưng Blue đã bỏ lỡ một cái, vì vậy Deinonychus đi theo họ, bắt họ.\r\n\r\nDeinonychus đã chiếm được Dsungaripterus. Sau đó, họ đuổi theo Cy và bắt anh ta dồn vào một vách đá. May mắn thay, Speckles và Fang phục kích chúng. Một Deinonychus bị bỏ lại phía sau và bị Cy đánh gục. Con đường bị chặn bởi những tảng đá, nhưng một đàn Pukyongosaurus đã dọn sạch những tảng đá.\r\n\r\nNúi lửa đang phun trào và Dsungaripterus nói với họ về sự phun trào của nó. Trong khi đó, Speckles, Fang và Cy đã chiến đấu với gói Deinonychus. Blade nói với những con khủng long khác giẫm đạp ra khỏi mái vòm, vì núi lửa đang phun trào. Speckles, Fang và Cy đã tìm kiếm Junior. Blade đã chiến đấu với một bộ đôi Deinonychus và Therizinosaurus qua một hố dung nham, sau đó một cú đánh và Therizinosaurus và Deinonychus rơi xuống hố của dung nham.\r\n\r\nSpeckles và Fang cuối cùng đã tìm thấy Junior, Blue và Blade, những người chạy về phía một con sông. Mặc dù Junior không biết bơi, anh ấy đã nhảy vào và Blue và Blade cũng vậy. Khi họ lao xuống, họ tìm thấy cái hang mà Dsungaripterus đang nói đến. Ở đó, họ tìm thấy Dusty. Họ đã gặp một số kỳ nhông có thể ăn khủng long. May mắn thay, Speckles và Fang đã có thể cứu họ. Họ tìm thấy một con kỳ nhông khổng lồ đang cố ăn chúng. Junior hy sinh bản thân mình bằng cách để con kỳ nhông đánh anh ta. May mắn thay, anh ấy còn sống. Nhưng dung nham đã bắt đầu phun trào, vì vậy không có thời gian. Speckles đã chiến đấu với một con quái vật dung nham và họ đã có thể đưa nó ra ngoài an toàn.\r\n\r\nCuối cùng cũng đến thiên đường, Cy nói lời tạm biệt với Speckles, Fang, Blue, Junior, Blade và Dusty, những người bắt đầu một cuộc sống mới cùng nhau.', 1, 'dino-king-poster_vi_233.jpg', 3, 6, 5, 0, 0, 0, NULL, '2022-08-09 10:50:58', '2018', NULL, NULL, NULL, 1),
(16, 'Ỷ THIÊN ĐỒ LONG KÝ', NULL, 'fk4DRpqMwtE', 'y-thien-do-long-ky', 'Ẩn giấu pho võ công thượng đẳng Cửu Âm Chân Kinh và bộ Võ Mục Di Thư lừng lẫy, Ỷ Thiên kiếm và Đồ Long đao đã gây nên những cuộc tranh giành không hồi kết giữa các bang phái võ lâm. Người cần đao để trả thù, người lại muốn giương danh với thế nhân, kẻ tham vọng hiệu triệu cả thiên hạ. Giữa lúc triều đình phong kiến Trung Hoa đang dần suy yếu, đất nước đứng trước nguy cơ xâm lược của người Mông Cổ, sứ mạng tái thiết trật tự được đặt vào tay những người thành tâm và hùng tâm mà Trương Vô Kỵ là nhân vật tiêu biểu. Vô Kỵ sẽ thống nhất các bang phái như thế nào để hiệp tâm đánh bại quân Mông Cổ? Bí quyết ẩn giấu trong hai báu vật sẽ giúp Vô Kỵ ra sao?', 1, 'ge9u-hqtwzee52345054.jpg', 7, 5, 7, 1, 1, 1, NULL, '2022-08-09 14:49:21', '2003', 'ythien,dolong,kiemhiep', NULL, NULL, 40),
(17, 'Clash of the Titans', NULL, 'z7cEL6n24d4', 'clash-of-the-titans', 'Clash of the Titans là phiên bản làm lại từ một bộ phim thần thoại Hy Lạp cùng tên được thực hiện năm 1981. Chuyện xoay quanh người anh hùng Perseus, một người bị thần Hades (thần cai quản địa ngục và là một trong những người anh em của thần Zeus) hãm hại cả gia đình, trong đó có cả công chúa Andromeda, người anh yêu. Không còn gì để mất, Perseus tình nguyện gánh vác một nhiệm vụ nguy hiểm: đánh bại thần Hades trước khi hắn cướp được quyền lực từ thần Zeus và biến trái đất thành địa ngục...', 1, 'clash88.jpg', 3, 6, 5, 0, 0, 0, NULL, '2022-08-09 10:54:38', '2001', NULL, 0, NULL, 1),
(18, 'VÓ NGỰA THẢO NGUYÊN', NULL, 'AxYRa8Cl_z4?', 'vo-ngua-thao-nguyen', 'Trên thảo nguyên mênh mông, có một chàng trai khôi ngô tuấn tú tên là Khấu Anh Kiệt. Với tài năng thuần phục ngựa, anh được mọi người gọi là \"Tiểu Mã Vương\". Anh Kiệt rất thích con ngựa hoang hung hãn và khỏe mạnh Hắc Thủy Tiên và ngày đêm tìm cách bắt về thuần phục.Bảo Mã này rất được nhiều người trên giang hồ quan tâm, trong đó có “Ngũ Tiểu Long” – vũ nội thập nhị lệnh – Thiết Tiểu Vi con gái của tổng lệnh chủ Thiết Hải Đường, còn có 1 người thần bí lạc đà lão nhân – Quách Bạch Vân. Kỹ thuật thuần phục ngựa của Khấu Anh Kiệt rất được mọi người khâm phục, trải qua mấy ngày Khấu Anh Kiệt đã bắt và thuần phục được “Hắc Thuy Tiên”, ông Quách Bạch Vân rất thích con “Hắc Thủy Tiên” ông ta muốn mua con ngựa này với giá cao, nhưng không được Khấu Anh Kiệt đồng ý, hai người tranh chấp mấy ngày, Khấu Anh Kiệt rất ngưỡng mộ võ công cao cường của Quách Bạch Vân, còn ông ta rất thích con người của Khấu Anh Kiệt, trong lúc chia tay ông Quách Bạch Vân để lại câu thư thất ngôn tuyệt câu nơi hẹn gặp lại nhau….\r\n     Trong lúc Khấu Anh Kiệt tới nơi hẹn, thì thấy ông ta đang quyết đấu với Thiết Hải Đường một cuộc hẹn quyết đấu của 20 năm trước, Thiết Hải Đường dùng ám khí - đàn chỉ thần châm đánh lén Quách Bạch Vân, ông ta được Khấu Anh Kiệt cứu thoát, vì trúng độc quá nặng ông ta đã chết, trước khi chết ông ta nhận Khấu Anh Kiệt làm đệ tử, truyền hết võ công cho anh ta, đem số phận của Bạch Mã Môn vào tay Khấu Anh Kiệt, ông ta giao cho Khấu Anh Kiệt vật làm bằng chứng là bức tranh của cô con gái Quách Thái Lăng và bình pha lê…… Thiết Hải Đường sợ mọi người trên giang hồ biết mình dùng thủ đoạn bỉ ỏi để hạ Quách Bạch Vân , ông ta cho thủ hạ Ứng Thiên Lý đi giết Khấu Anh Kiệt diệt khẩu, rất may được Thiết Tiểu Vi cứu mạng, sau đó Tiểu Vi bị cha cô ta chừng phạt rất nặng. Sau khi Khấu Anh Kiệt đi vào Bạch Môn Sơn trang đối mặt với một thử thách mới, đại sư huynh là con người nham hiểm, nhị sư huynh thì xảo trá, 2 người không công nhận Khấu Anh Kiệt là đệ tử của Bạch Mã Môn, và muốn tìm cách ăn cắp bức tranh “Ngư Long Bách Biến” của sư phụ để lại. Quách Thái Lăng thì rất cảm kích Khấu Anh Kiệt đứa di thể của cha mình về, nhưng biết được Khấu Anh Kiệt đã có ý chung nhân là con gái của kẻ thù giết cha, dẫn đến Quách Thái Lăng rất buồn, cộng thêm có 2 vị sư huynh khiêu khích li gián dẫn đến Quách Thái Lăng cũng không ủng hộ anh ta.\r\n    Sau khi ra khỏi cốc, Khấu Anh Kiệt đánh bại được đệ tử giỏi rất của Thiết Hải Đường là Ưng Thiên Lý, tìm ra gián điệp của Thiết Hải Đường làm việc tại Mạch Mã Môn đó là Thẩm Ngao Sương phu nhân của Quách Bạch Vân, Thiết Hải Đường cảm thấy sợ Khấu Anh Kiệt sẽ uy hiếp được mình. Ông ta lợi dụng tình cảm của cô con gái mình để rủ Khấu Anh Kiệt tới, cuối cùng cái gì đến cũng phải đến, sức mạnh của chính và tà chính thức quyết chiến với nhau, tà không thể thắng chính, Khấu Anh Kiệt có sự giúp đỡ của “Hắc Thủy Tiên” công lực như hổ thêm cánh đánh bại Thiết Hải Đường, ông ta lại dùng ám khí - đàn chỉ thần châm đánh lén Khấu Anh Kiệt, lần này Khấu Anh Kiệt được Thiết Tiểu Vi dùng mình che chở cho anh ta. Khấu Anh Kiết rất đau đớn thấy miệng của người yêu mình toàn máu tươi, hỏi tại sau em phải làm như vậy? Cô ta nói kiếp này em không đợi được hoa kiệu của anh, kiếp sau em nhất định sẽ chờ được hoa kiệu của anh…….', 1, 'vo-ngua-thao-nguyen18.jpg', 7, 5, 7, 0, 0, 0, NULL, '2022-08-09 10:48:58', NULL, 'vongua,hacthuytien,kiemhiep', 2, NULL, 1),
(19, 'NẮNG-2', NULL, 'tyaq_lOwqmg', 'nang-2', 'Mẹ Mưa tình cờ bị bắt cóc và tham gia vào cuộc chạy trốn sự truy đuổi của bọn giang hồ cùng với một cặp đôi bất đắc dĩ. Trên đường đi, nhiều tình huống bi hài đã xảy ra khiến ba kẻ không quen biết phải phối hợp chặt chẽ. Bé Nắng bơ vơ tìm mẹ khắp nơi với sự giúp đỡ của hai người chú. Mưa – cô bán vé số hiền lành vẫn ngờ nghệch và sống tiêu chí “người tốt thì sẽ luôn tốt” như ngày nào. “Hoa hậu hài” Thu Trang vào vai người thiếu năng trí tuệ xuất sắc, không có điểm nào chê. Hình ảnh được thiết kế tông màu chủ đạo là tươi sáng, chân thật mà không màu mè. \r\nHầu như toàn bộ bối cảnh đều được quay ở những nơi trong thực tế. Điều này khiến bộ phim hoàn toàn phù hợp với mọi đối tượng khán giả, từ các bậc phụ huynh cho đến nhóc tì. Thông điệp của phim không đơn giản chỉ là cái thiện luôn thắng cái ác. Ý nghĩa nhân văn được truyền tải rất nhiều. Từ lòng nhân từ, lòng hiếu thảo, lòng mẫu tử/phụ tử, tình xóm giềng, tinh thần đồng đội, niềm tin vào cuộc sống... cho đến “tình nghĩa giang hồ” đều được gửi đến khán giả một cách khéo léo thông qua những tình huống. Là phim tình cảm gia đình Việt Nam duy nhất trong dịp nghỉ lễ Quốc Khánh 2/9, Nắng 2 là một bộ phim dành cho những gia đình mong muốn có một khoảng thời gian thư giãn bên nhau.', 1, 'nang_427.jpg', 8, 6, 1, 1, 0, 0, NULL, '2022-08-09 10:50:22', '2018', NULL, 1, NULL, 1),
(20, 'THƯƠNG NGÀY NẮNG VỀ', NULL, '815dgSNKm_Q', 'thuong-ngay-nang-ve', 'Thương ngày nắng về xoay quanh gia đình bà Nga (NSƯT Thanh Quý) bán bún riêu sống cùng cậu em trai không được thông minh và ba cô con gái. Là một người phụ nữ góa chồng bước vào độ tuổi 60 nhưng tâm trí của bà vẫn chưa hề an yên khi ba cô con gái dẫu đã lớn khôn nhưng luôn đầy những khúc mắc trong cuộc sống. Dù hay lắm điều, cằn nhằn, nóng nảy, nhưng với đức hi sinh và tình yêu thương vô hạn, bà luôn là một điểm tựa vững vàng cho em trai và những cô con gái của mình..', 1, 'thuong-ngay-nang-ve97.jpg', 7, 5, 1, 0, 3, 0, NULL, '2022-08-09 10:50:16', '2005', NULL, 1, NULL, 1),
(21, 'THOR - TÌNH YÊU VÀ SẤM SÉT', NULL, 'UBgPypHGAqE', 'thor-tinh-yeu-va-sam-set', 'Thor đi vào một cuộc hành trình không giống như bất cứ cuộc phiêu lưu anh ấy từng phải đối mặt, một cuộc tìm kiếm sự bình yên bên trong tâm hồn của vị Thần Sấm. Nhưng việc nghỉ hưu của anh ta bị gián đoạn bởi một kẻ giết người nổi tiếng liên thiên hà được gọi là Gorr the God Butcher, kẻ đang huỷ diệt sự sống của các vị thần. Để chống lại mối đe dọa, Thor nhờ đến sự giúp đỡ của Vua Valkyrie, Korg và bạn gái cũ Jane Foster, người bỗng nhiên sử dụng được chiếc búa Mjolnir ngon lành cành đào một cách khó hiểu. Cùng nhau, họ tham gia vào một cuộc phiêu lưu vũ trụ đầy cam go để khám phá bí ẩn về sự báo thù của Gorr the God Butcher và ngăn chặn hắn trước khi quá muộn.', 1, 'thor87.jpg', 3, 6, 5, 1, 0, 0, NULL, '2022-08-09 10:50:06', '2020', NULL, 2, NULL, 1),
(22, 'Minions: Sự trỗi dậy của Gru', NULL, '6DxjJzmYsXo', 'minions-su-troi-day-cua-gru', 'Là một fanboy của nhóm siêu ác nhân được biết đến với cái tên Vicious 6, Gru ấp ủ một kế hoạch trở thành kẻ siêu xấu xa để tham gia cùng họ. Với sự giúp sức của các Minion, hành trình này trở nên khá là \"xấu xa\" và gây cười cực mạnh.', 1, 'minions52.jpg', 6, 6, 5, 0, 0, 0, NULL, '2022-08-09 10:49:59', '2001', NULL, NULL, NULL, 1),
(23, 'EM CHƯA 18', NULL, '_affkHceSj4', 'em-chua-18', 'Em chưa 18 kể về “cú ngã” của tay chơi Hoàng. Là một công tử với túi tiền rủng rỉnh, gương mặt đẹp trai, thích qua đêm với các cô gái nhưng không bao giờ ngủ với cô nàng nào lần thứ hai, Hoàng vướng vào rắc rối khi cặp với cô nàng trẻ con Linh Đan. Phim xoay quanh chuyện anh chàng “trai hư” 35 tuổi tên Hoàng trong một lần đi bar đã có tình một đêm với một hot girl lần đầu gặp gỡ. Tuy nhiên, sáng hôm sau, anh chàng mới tá hỏa khi biết cô nàng có tên Linh Đan này chưa đủ 18 tuổi. Điều trớ trêu là Linh Đan đã quay lại video cảnh “ân ái” giữa hai người và dọa tố cáo do Hoàng quan hệ với người dưới tuổi vị thành niên, nếu anh chàng tay chơi này không chịu làm bạn trai của cô.\r\n Những tình huống dở khóc dở cười đẩy cả hai xích lại gần nhau hơn. Những bí mật về nàng hot girl dần được hé lộ… Phim tạo được dấu ấn ở những tình huống hài và thẳng thắn nói về cuộc sống hiện đại ngày nay của các cô cậu tuổi teen – không phải chỉ ở nhà làm “con ngoan trò giỏi” như trước kia mà đã biết lên bar vào cuối tuần, xài điện thoại xịn và sẵn sàng bộc lộ cảm xúc của bản thân chứ chẳng cần che giấu trước mặt cha mẹ.', 1, 'Em_chưa_18_poster60.jpg', 8, 6, 1, 1, 2, 1, NULL, '2022-08-09 13:42:21', '2007', NULL, 2, NULL, 1),
(24, 'Spider-Man: Far From Home (Người Nhện Xa Nhà)', '129 phút', 'Nt9L1jCKGnE', 'spider-man-far-from-home-nguoi-nhen-xa-nha', '“Spider-Man: Far From Home” là phần tiếp theo của “Spider-Man: Homecoming”. Bộ phim tiếp tục kể về cuộc hành trình của Peter Parker, từ một anh hùng nhí trở thành người kế nhiệm Tony Stark.\r\n\r\nPeter Parker cùng với nhóm bạn học của mình tìm cách tái hòa nhập với thế giới sau 5 năm. Thế nhưng, mọi chuyện trở nên rắc rối khi đám quái vật Elemental xuất hiện và tấn công họ trong suốt hành trình...', 1, 'Người_Nhện–Xa_nhà–poster29.jpeg', 3, 6, 5, 1, 2, 0, '2022-08-09 10:29:10', '2022-08-10 13:45:29', '2022', 'spiderman, phimhot, khoahocvientuong', 1, NULL, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `movie_genre`
--

CREATE TABLE `movie_genre` (
  `id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `movie_genre`
--

INSERT INTO `movie_genre` (`id`, `movie_id`, `genre_id`) VALUES
(1, 26, 5),
(2, 26, 6),
(3, 18, 5),
(4, 25, 6),
(6, 23, 6),
(7, 22, 6),
(8, 21, 6),
(9, 20, 5),
(10, 19, 6),
(12, 16, 5),
(13, 15, 6),
(14, 14, 5),
(15, 13, 6),
(16, 12, 6),
(17, 11, 6),
(18, 5, 5),
(19, 6, 5),
(20, 10, 5),
(21, 17, 5),
(22, 17, 6),
(23, 24, 6),
(24, 23, 5),
(25, 13, 5),
(26, 27, 5),
(27, 12, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Nguyễn Quang Đức', 'duciker14@gmail.com', NULL, '$2y$10$Inq643uyQOj3WFkcKJruBuGpWEp4mMGCWEGZe.3vfhH.Yvq0i/QRy', NULL, '2022-07-26 02:27:01', '2022-07-26 02:27:01'),
(2, 'Đức Nguyễn', 'duciker1499@gmail.com', NULL, '$2y$10$pR9ofd/DHm0bIW8CIWze6.qewLz.gFDLfA4xIVKF0/0MteEVcil32', NULL, '2022-07-27 01:26:25', '2022-07-27 01:26:25');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `episodes`
--
ALTER TABLE `episodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_movie_episode` (`movie_id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `movie_genre`
--
ALTER TABLE `movie_genre`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `episodes`
--
ALTER TABLE `episodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `movie_genre`
--
ALTER TABLE `movie_genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `episodes`
--
ALTER TABLE `episodes`
  ADD CONSTRAINT `fk_movie_episode` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
