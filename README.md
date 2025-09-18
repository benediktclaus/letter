# Simple typst Letter Template

![License](https://img.shields.io/badge/License-MIT-blue.svg)

A simple yet flexible typst template for standard letters. It is aimed at all typst users who want to create personal or business letters quickly and easily.

## Preview

This is what your finished letter could look like:

![Preview of a letter created with the template](img/page1.png)

## Features

* **Easy to Use:** Apply the template to your document with a single `#show` rule.
* **Automatic Date:** The date is automatically set to the current day by default.
* **Flexible Reference Block:** Easily add a block for references like customer numbers, invoice numbers, or internal codes.
* **Fold Marks:** Optional fold marks can be displayed.
* **Customizable:** Many elements, like the sender block or the return address, can be toggled on and off.
* **Automated Pagination:** Page numbering ("Page X of Y") automatically appears from the second page onward.

## Requirements

This template uses the 'Roboto' font from Google Fonts. Please ensure this font is installed on your system for the document to render correctly.

* **Download:** [Google Fonts: Roboto](https://fonts\.google\.com/specimen/Roboto)


## Installation

As this is a local typst package, the installation is manual.

1. Clone this repository or download it as a ZIP file.
2. Move the entire project folder into the `local` folder of your typst packages directory.

The path to the packages directory is typically:
* **Linux**: `~/.local/share/typst/packages/local/`
* **macOS**: `~/Library/Application Support/typst/packages/local/`
* **Windows**: `%APPDATA%\typst\packages\local`

You can rename the folder to your liking, e.g., `letter`. The import path in the next step is derived from this folder name.

## Usage

Create a new `.typ` file (e.g., `my-letter.typ`) and import the template as follows. The `@local` namespace refers to the packages directory, and `letter` is the name you gave the folder in the previous step.

```typst
#import "@local/letter:0.3.0": *

#show: briefpapier.with(
  // -- Sender Information (neutral) --
  show-absender: true,
  absender: [
    *John Doe*\
    1 Sample Street\
    12345 Sampleton\
    Phone: (0123) 456-789\
    john\@doe-corp.com
  ],
  show-ruecksende: true,
  ruecksende-adresse: [John Doe, 1 Sample Street, 12345 Sampleton],
  
  // -- Recipient Address (neutral) --
  adresse: [
    Example Company Ltd.\
    Attn: Ms. Jane Doe\
    2 Example Avenue\
    54321 Exampleville
  ],

  // -- Letter Details (neutral) --
  referenzen: (
    ([Customer No.], [CUS-12345]),
    ([Your Reference], [INQ-2025-ABC]),
  ),
  betreff: [Subject: Your inquiry of September 15, 2025],
  ort: [Sampleton],
  datum: [September 17, 2025],

  // -- Display Options --
  ticks: true,

  // -- Closing (neutral) --
  absender-gruss: [
    John Doe
  ],
)

// -- Letter Body (neutral) --

Dear Ms. Doe,

Thank you for your message and your interest in our services.

Enclosed, you will find the documents you requested. We have reviewed all your questions and prepared the corresponding information within these documents.

Should any further questions arise after your review, please do not hesitate to contact us. You can reach us at any time by phone or email.

Sincerely,
```

## `#briefpapier()` Function Parameters

The template is controlled by the `#briefpapier()` function. Here are all available parameters:

| Parameter             | Type               | Default Value                              | Description                                                                                             |
| ----------------------- | -------------------- | ---------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `absender`            | `content`          | `[]`                                       | A content block with the full sender details, placed in the top right.                                  |
| `show-absender`       | `boolean`          | `false`                                    | If `true`, the `absender` block is displayed.                                                           |
| `absender-gruss`      | `content`          | `[]`                                       | The closing block at the end of the letter, e.g., with name and job title.                              |
| `ruecksende-adresse`  | `content`          | `[]`                                       | A single-line return address for the window of an envelope.                                             |
| `show-ruecksende`     | `boolean`          | `false`                                    | If `true`, the `ruecksende-adresse` is displayed above the recipient's address field.                   |
| `adresse`             | `content`          | `[]`                                       | The recipient's address field.                                                                          |
| `ort`                 | `content`          | `[Dortmund]`                               | The city or location displayed before the date.                                                         |
| `betreff`             | `content`          | `[]`                                       | The subject line of the letter. Is automatically formatted in bold.                                     |
| `referenzen`          | `array` or `none`  | `none`                                     | An array of tuples for reference details. Example: `( ("Key", "Value"), )`.                             |
| `datum`               | `content` or `none`| `none`                                     | The date of the letter. If `none`, the current date in `DD.MM.YYYY` format is automatically used.       |
| `ticks`               | `boolean`          | `false`                                    | If `true`, fold and punch marks are displayed on the page margin.                                       |
| `body`                | `content`          | (required)                                 | The actual content (body text) of your letter.                                                          |

## License

This project is licensed under the **MIT License**. See the `LICENSE` file for details.
