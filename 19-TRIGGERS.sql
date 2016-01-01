CREATE TRIGGER hilight_new_star AFTER INSERT ON stars
BEGIN
DELETE FROM hilight;
INSERT INTO hilight SELECT MAX(starid) FROM stars;
END
