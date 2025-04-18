use spotify_data;

SELECT * FROM tracks;

-- 1) List All Songs by Popularity: --
SELECT TrackName, ArtistName, Popularity
FROM Tracks
ORDER BY Popularity DESC;
-- 2) Find Average Attributes Across All Tracks: --
SELECT 
  AVG(BeatsPerMinute) AS AvgBPM,
  AVG(Energy) AS AvgEnergy,
  AVG(Danceability) AS AvgDanceability,
  AVG(Loudness) AS AvgLoudness,
  AVG(Acousticness) AS AvgAcousticness
FROM Tracks;
-- 3) Top Genres by Number of Tracks: --
SELECT Genre, COUNT(*) AS NumberOfTracks
FROM Tracks
GROUP BY Genre
ORDER BY NumberOfTracks DESC;
-- 4) Find Tracks with High Danceability and Energy: --
SELECT TrackName, ArtistName
FROM Tracks
WHERE Danceability > 60 AND Energy > 60
ORDER BY Danceability DESC, Energy DESC;
-- 5) Tracks with Above-Average Acousticness: --
SELECT TrackName, ArtistName
FROM Tracks
WHERE Acousticness > (SELECT AVG(Acousticness) FROM Tracks)
ORDER BY Acousticness DESC;
-- 6) Find the Most Common BPM Range: --
SELECT 
  FLOOR(BeatsPerMinute / 10)*10 AS BPM_Range,
  COUNT(*) AS Count
FROM Tracks
GROUP BY BPM_Range
ORDER BY Count DESC;
-- 7) Top Artists by Total Tracks: --
SELECT ArtistName, COUNT(*) AS TotalTracks
FROM Tracks
GROUP BY ArtistName
ORDER BY TotalTracks DESC;
-- 8) Songs With Highest Valence (Happiest Songs):--
SELECT TrackName, ArtistName, Valence
FROM Tracks
ORDER BY Valence DESC
LIMIT 5;
-- 9) Find Tracks Longer Than Average Length:--
SELECT TrackName, ArtistName, Length
FROM Tracks
WHERE Length > (SELECT AVG(Length) FROM Tracks)
ORDER BY Length DESC;