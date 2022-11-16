module.exports = {
  extends: ["../.eslintrc.js"],
  plugins: ["@typescript-eslint", "prettier"],
  overrides: [
    {
      files: ["*.ts"],
      env: {
        es2021: true,
        jest: true,
      },
      extends: ["plugin:@typescript-eslint/all", "eslint:all", "prettier"],
      parserOptions: {
        tsconfigRootDir: __dirname,
        project: ["tsconfig.json"],
        ecmaVersion: "latest",
        sourceType: "module",
      },
      rules: {
        "func-style": "off",
        camelcase: "error",
        "no-duplicate-imports": "error",
        "sort-imports": "off",
        "no-undef": "off",
        "no-void": "off",
        "@typescript-eslint/object-curly-spacing": "off",
        "@typescript-eslint/indent": "off",
        "@typescript-eslint/naming-convention": "off",
        "@typescript-eslint/space-before-function-paren": "off",
        "@typescript-eslint/prefer-readonly-parameter-types": "off",
      },
    },
  ],
};
