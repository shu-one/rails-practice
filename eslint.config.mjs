import js from "@eslint/js";
import tseslint from "typescript-eslint";
import {defineConfig} from "eslint/config";
import react from "eslint-plugin-react";

export default defineConfig([
    js.configs.recommended,
    ...tseslint.configs.recommended,
    {
        files: ["**/*.{js,mjs,cjs,jsx,ts,tsx}"],
        plugins: {
            react,
        },
        rules: {
            // React 18 / JSX automatic runtime
            "react/react-in-jsx-scope": "off",
            "react/jsx-uses-react": "off",

            // TypeScript を使うなら不要
            "react/prop-types": "off",

            // 最初のプロパティを改行させる設定
            "react/jsx-first-prop-new-line": ["error", "multiline"],

            // JSXのプロパティを1行ずつにする設定
            "react/jsx-max-props-per-line": [1, {"when": "multiline"}],

            // 1行に1つのJSX要素のみを許可する設定
            "react/jsx-one-expression-per-line": ["error", {"allow": "none"}],

            // その他
            "semi": ["error", "always"],
        },
    },
]);
