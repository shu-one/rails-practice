import {Input} from "@chakra-ui/react";
import {ChangeEvent} from "react";

type Props = {
  type: "text" | "password";
  name: string;
  value?: string;
  placeholder?: string;
  onChange?: (e: ChangeEvent<HTMLInputElement>) => void;
}

export function FlushedInputText(props: Props) {
  return (
    <Input
      type={props.type}
      name={props.name}
      value={props.value}
      placeholder={props.placeholder}
      onChange={props.onChange}
      variant="flushed"/>
  );
}
