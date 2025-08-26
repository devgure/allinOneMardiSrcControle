// services/media-service/src/controllers/media.js
const AWS = require('aws-sdk');
const s3 = new AWS.S3();

exports.uploadPhoto = async (req, res) => {
  const { buffer, mimetype } = req.file;
  const key = `photos/${Date.now()}-${req.user.id}.jpg`;

  try {
    const result = await s3.upload({
      Bucket: process.env.AWS_S3_BUCKET,
      Key: key,
      Body: buffer,
      ContentType: mimetype,
    }).promise();

    // Trigger moderation
    await fetch(`${process.env.AI_IMAGE_MODERATION_URL}/moderate`, {
      method: 'POST',
      body: JSON.stringify({ imageUrl: result.Location }),
      headers: { 'Content-Type': 'application/json' },
    });

    res.json({ url: result.Location });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};