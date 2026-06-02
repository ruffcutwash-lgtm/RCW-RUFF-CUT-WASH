const http = require('http');
const https = require('https');
const fs = require('fs');
const path = require('path');
const url = require('url');

const API_KEY = process.env.ELEVENLABS_API_KEY;
const PORT = process.env.PORT || 3000;

const server = http.createServer((req, res) => {
  // CORS for dev
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') {
    res.writeHead(204);
    res.end();
    return;
  }

  const parsed = url.parse(req.url, true);

  if (parsed.pathname === '/api/tts' && req.method === 'POST') {
    if (!API_KEY) {
      res.writeHead(500, { 'Content-Type': 'application/json' });
      res.end(JSON.stringify({ error: 'ELEVENLABS_API_KEY environment variable not set on server' }));
      return;
    }

    let body = '';
    req.on('data', chunk => { body += chunk.toString(); });
    req.on('end', () => {
      try {
        const { text, voiceId = '21m00Tcm4TlvDq8ikWAM' } = JSON.parse(body || '{}');
        if (!text || typeof text !== 'string') {
          res.writeHead(400, { 'Content-Type': 'application/json' });
          res.end(JSON.stringify({ error: 'Missing or invalid text' }));
          return;
        }

        const options = {
          hostname: 'api.elevenlabs.io',
          port: 443,
          path: `/v1/text-to-speech/${encodeURIComponent(voiceId)}`,
          method: 'POST',
          headers: {
            'Accept': 'audio/mpeg',
            'xi-api-key': API_KEY,
            'Content-Type': 'application/json',
          }
        };

        const elevenReq = https.request(options, (elevenRes) => {
          if (!elevenRes.statusCode || elevenRes.statusCode >= 400) {
            res.writeHead(elevenRes.statusCode || 500);
            elevenRes.pipe(res);
            return;
          }
          res.writeHead(200, {
            'Content-Type': 'audio/mpeg',
            'Cache-Control': 'no-cache'
          });
          elevenRes.pipe(res);
        });

        elevenReq.on('error', (e) => {
          console.error('ElevenLabs request error:', e);
          if (!res.headersSent) res.writeHead(502);
          res.end('TTS service error');
        });

        elevenReq.write(JSON.stringify({
          text: text,
          model_id: 'eleven_multilingual_v2',
          voice_settings: {
            stability: 0.5,
            similarity_boost: 0.75,
            style: 0.5,
            use_speaker_boost: true
          }
        }));
        elevenReq.end();
      } catch (e) {
        console.error('Parse error:', e);
        if (!res.headersSent) res.writeHead(400);
        res.end('Invalid request');
      }
    });
    return;
  }

  // Serve static files (for the website)
  let filePath = path.join(__dirname, parsed.pathname === '/' ? 'index.html' : parsed.pathname);
  // Security: prevent path traversal
  if (!filePath.startsWith(__dirname)) {
    res.writeHead(403);
    res.end('Forbidden');
    return;
  }

  fs.stat(filePath, (err, stats) => {
    if (err || !stats.isFile()) {
      res.writeHead(404, { 'Content-Type': 'text/plain' });
      res.end('Not Found');
      return;
    }
    const ext = path.extname(filePath).toLowerCase();
    const mimeTypes = {
      '.html': 'text/html',
      '.js': 'text/javascript',
      '.css': 'text/css',
      '.mp4': 'video/mp4',
      '.jpg': 'image/jpeg',
      '.jpeg': 'image/jpeg',
      '.png': 'image/png',
      '.json': 'application/json'
    };
    const contentType = mimeTypes[ext] || 'application/octet-stream';
    res.writeHead(200, { 'Content-Type': contentType });
    fs.createReadStream(filePath).pipe(res);
  });
});

server.listen(PORT, () => {
  console.log(`Ruff Cut & Wash server running at http://localhost:${PORT}`);
  console.log(`ElevenLabs TTS proxy available at http://localhost:${PORT}/api/tts`);
  if (!API_KEY) {
    console.warn('WARNING: ELEVENLABS_API_KEY is not set. Set it before starting for TTS to work.');
  }
});
