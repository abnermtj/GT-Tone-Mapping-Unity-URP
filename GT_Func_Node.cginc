// Helper function W_f
float W_f(float x, float e0, float e1) {
    if (x <= e0) return 0.0;
    if (x >= e1) return 1.0;
    float a = (x - e0) / (e1 - e0);
    return a * a * (3.0 - 2.0 * a);
}

// Helper function H_f
float H_f(float x, float e0, float e1) {
    if (x <= e0) return 0.0;
    if (x >= e1) return 1.0;
    return (x - e0) / (e1 - e0);
}

// Main function GranTurismoTonemapper
void GranTurismoTonemapper_float(float x, out float returnVal) {
    float P = 1.0;
    float a = 1.0;
    float m = 0.22;
    float l = 0.4;
    float c = 1.33;
    float b = 0.0;
    float e = 2.71828;
    float l0 = (P - m) * l / a;
    float L0 = m - m / a;
    float L1 = m + (1 - m) / a;
    float L_x = m + a * (x - m);
    float T_x = m * pow(x / m, c) + b;
    float S0 = m + l0;
    float S1 = m + a * l0;
    float C2 = a * P / (P - S1);
    float S_x = P - (P - S1) * pow(e, -(C2 * (x - S0) / P));
    
    float w0_x = 1.0 - W_f(x, 0.0, m);
    float w2_x = H_f(x, m + l0, m + l0);
    float w1_x = 1.0 - w0_x - w2_x;
    
    returnVal = T_x * w0_x + L_x * w1_x + S_x * w2_x;
}
