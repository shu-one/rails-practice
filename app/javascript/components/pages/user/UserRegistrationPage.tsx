import {Box, Button, Field, HStack} from "@chakra-ui/react";
import {FlushedInputText} from "components/atoms/input/text/FlushedInputText";

export function UserRegistrationPage() {
  return (
    <>
      <form action="/user/create" method="POST">
        <input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>"/>
        <Field.Root>
          <HStack>
            <Box w={"120px"}>
              <Field.Label>
                ユーザ名
              </Field.Label>
            </Box>
            <FlushedInputText
              type={"text"}
              name={"loginId"}
              placeholder="ログインID"/>
          </HStack>
        </Field.Root>
        <Field.Root>
          <HStack>
            <Box w={"120px"}>
              <Field.Label>
                パスワード
              </Field.Label>
            </Box>
            <FlushedInputText
              type={"password"}
              name={"password"}/>
          </HStack>
        </Field.Root>
        <Field.Root>
          <HStack>
            <Box w={"120px"}>
              <Field.Label>
                パスワード（確認用）
              </Field.Label>
            </Box>
            <FlushedInputText
              type={"password"}
              name={"confirmPassword"}/>
          </HStack>
        </Field.Root>
        <Button type={"submit"}>
          登録
        </Button>
      </form>
    </>
  );
}
