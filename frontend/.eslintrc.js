module.exports = {
  extends: ["../.eslintrc.js"],
  plugins: ["react", "@typescript-eslint", "prettier"],
  settings: {
    react: {
      version: "detect",
    },
  },
  overrides: [
    {
      files: ["*.ts", "*.tsx"],
      env: {
        browser: true,
        es2021: true,
        jest: true,
      },
      extends: [
        "plugin:@typescript-eslint/all",
        "eslint:all",
        "plugin:react/all",
        "prettier",
      ],
      parserOptions: {
        tsconfigRootDir: __dirname,
        project: ["tsconfig.json"],
        ecmaFeatures: {
          jsx: true,
        },
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
        "react/react-in-jsx-scope": "off",
        "react/jsx-filename-extension": "off",
        "@typescript-eslint/object-curly-spacing": "off",
        "@typescript-eslint/indent": "off",
        "@typescript-eslint/naming-convention": "off",
        "@typescript-eslint/space-before-function-paren": "off",
        "@typescript-eslint/prefer-readonly-parameter-types": "off",
      },
    },
  ],
};
