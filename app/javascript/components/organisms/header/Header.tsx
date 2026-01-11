import {Box, Button, Center, Flex, Image, Link, Spacer} from "@chakra-ui/react";
import logo from "../../../../assets/images/logo.png";
import {FaAddressBook} from "react-icons/fa";

export function Header() {
  return (
    <Box borderBottomWidth={1}>
      <Flex gap={2}>
        <Image src={logo} height={"50px"}></Image>
        <Center height={"50px"} width={"150px"}>
          <Button textStyle="lg" variant="outline">
            {/* TODO 遷移先を修正する */}
            <Link href={"/"}>
              タスク一覧
            </Link>
          </Button>
        </Center>
        <Center height={"50px"} width={"150px"}>
          <Button textStyle="lg" variant="outline">
            タスクカレンダー
          </Button>
        </Center>
        <Spacer/>
        <Center height={"50px"} width={"150px"}>
          <Button textStyle="lg" variant="outline">
            <FaAddressBook/>
          </Button>
        </Center>
      </Flex>
    </Box>
  );
}
