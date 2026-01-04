import React from 'react';
import {createRoot} from "react-dom/client";
import {UserRegistrationPage} from "components/pages/user/UserRegistrationPage";
import {ChakraProvider, defaultSystem} from "@chakra-ui/react";

document.addEventListener('DOMContentLoaded', () => {
  const root = createRoot(document.getElementById('root')!);
  root.render(<>
    <ChakraProvider value={defaultSystem}>
      <UserRegistrationPage/>
    </ChakraProvider>
  </>);
});
