import {createRoot} from "react-dom/client";
import {ChakraProvider, defaultSystem} from "@chakra-ui/react";
import React from "react";
import {TopIndexPage} from "components/pages/top/TopIndexPage";

document.addEventListener('DOMContentLoaded', () => {
  const root = createRoot(document.getElementById('root')!);
  root.render(<>
    <ChakraProvider value={defaultSystem}>
      <TopIndexPage/>
    </ChakraProvider>
  </>);
});
