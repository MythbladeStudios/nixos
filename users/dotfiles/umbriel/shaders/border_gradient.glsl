vec4 border(vec2 uv) {
  float t = (uv.x + uv.y) * 0.5;
  return mix(umbriel_palette_at(0.0), umbriel_palette_at(0.5), t) * umbriel_sample(uv).a;
}

