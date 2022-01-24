varying float vNoise;
varying vec2 vUv;
uniform sampler2D oceanTexture;

void main() {
    vec3 color1 = vec3(1.0, 0.0, 0.0);
    vec3 color2 = vec3(1.0, 1.0, 1.0);
    vec3 finalColor = mix(color1, color2, (vNoise + 1.0) * 0.5);

    vec2 newUV = vUv;
    
    newUV = vec2(newUV.x, newUV.y + newUV.x * 0.1);
    
    vec4 oceanView = texture2D(oceanTexture, newUV);

    gl_FragColor = vec4(finalColor, 1.0);
    gl_FragColor = vec4(vUv, 0.0, 1.0);
    gl_FragColor = oceanView;
}