module.exports = {
  root: true,
  env: {
    node: true,
  },
  extends: ["eslint:all", "prettier"],
  plugins: ["prettier", "jsonc"],
  rules: {
    "max-lines": "off",
    "prettier/prettier": "error",
  },
  overrides: [
    {
      extends: ["plugin:jsonc/all", "prettier"],
      files: ["*.json", "*.json5", "*.jsonc", ".prettierrc"],
      parser: "jsonc-eslint-parser",
      parserOptions: {
        jsonSyntax: "JSONC",
      },
      rules: {
        "multiline-comment-style": "off",
        strict: "off",
        "jsonc/array-element-newline": "off",
        "jsonc/indent": "off",
        "jsonc/key-name-casing": "off",
        "jsonc/no-comments": "off",
        "jsonc/object-curly-spacing": "off",
        "jsonc/sort-keys": "off",
      },
    },
  ],
};
