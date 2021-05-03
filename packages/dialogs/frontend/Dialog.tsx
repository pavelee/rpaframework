import React from 'react';
import { ThemeProvider, Box, Scroll } from '@robocorp/ds';
import { Element, Result } from './types';
import { Bridge } from './bridge';
import { Form } from './Form';

export type DialogProps = {
  elements: Element[];
};

export const Dialog = (props: DialogProps): JSX.Element => {
  const ref = React.useRef<HTMLDivElement>(null);

  React.useEffect(() => {
    if (ref.current) {
      Bridge.setHeight(ref.current.offsetHeight);
    }
  }, [props.elements]);

  return (
    <ThemeProvider>
      <Box width="100%" height="100%">
        <Scroll variant="custom" ref={ref}>
          <Box
            display="flex"
            alignItems="center"
            justifyContent="center"
            minHeight="100%"
          >
            <Box width="100%" p={32}>
              <Form
                elements={props.elements}
                onSubmit={(result: Result) => {
                  console.log('Result:', result);
                  Bridge.setResult(result);
                }}
              />
            </Box>
          </Box>
        </Scroll>
      </Box>
    </ThemeProvider>
  );
};
