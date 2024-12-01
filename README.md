# Recipe Sharing App

A web application that enables users to create, share, and manage cooking recipes. Users can browse recipes shared by the community, create their own recipes, and manage their culinary collection.

## Team

- [Laurent, Minh-Phuoc CHAU](minh-phuoc.chau@efrei.net)
- [Benjamin KAYGISIZ](benjamin.kaygisiz@efrei.net)
- [Paul SENECAL](paul.senecal@efrei.net)

## Requirements

- [Firebase](https://firebase.google.com/) project with **Firestore** and **Authentication** (email/password) enabled

### Angular

- [Node.js](https://nodejs.org/en/) v22.11.0 or higher
- [Pnpm](https://pnpm.io/) v9.14.2 or higher

### Flutter

- [Flutter](https://flutter.dev/) v3.24.5 or higher
- [Dart](https://dart.dev/) v3.5.4 or higher

## Installation

### Angular

#### Local setup

1. Navigate to the `apps/web` directory:

```bash
cd apps/web
```

2. Create an environment file by copying the sample:

```bash
cp src/config/enviroment.sample.ts src/config/enviroment.ts
```

3. Fill in the environment variables in `src/config/enviroment.ts`:

```typescript
export const environment = {
  firebase: {
    projectId: "",
    appId: "",
    storageBucket: "",
    apiKey: "",
    authDomain: "",
    messagingSenderId: "",
  },
};
```

4. Install the dependencies:

```bash
pnpm install --frozen-lockfile
```

5. Start the development server:

```bash
pnpm run start
```

#### Docker setup

Alternatively, you can run the application in a Docker container.

1. Create an environment file by copying the sample:

```bash
cp apps/web/src/config/enviroment.sample.ts apps/web/src/config/enviroment.ts
```

2. Fill in the environment variables in `apps/web/src/config/enviroment.ts`:

```typescript
export const environment = {
  firebase: {
    projectId: "",
    appId: "",
    storageBucket: "",
    apiKey: "",
    authDomain: "",
    messagingSenderId: "",
  },
};
```

3. Run the Docker container:

```bash
docker compose up --build
```

### Flutter

#### Locale setup

1. Navigate to the `apps/mobile` directory:

```bash
cd apps/mobile
```

2. Create the Firebase configuration file and fill in the values:

```bash
cp android/app/google-services.sample.json android/app/google-services.json

cp firebse.sample.json firebase.json
```

3. Install the dependencies:

```bash
flutter pub get
```

4. Start the development server:

```bash
flutter run
```

#### Docker setup

Alternatively, you can run the application in a Docker container.

1. Create the Firebase configuration file and fill in the values:

```bash
cp android/app/google-services.sample.json android/app/google-services.json

cp firebse.sample.json firebase.json
```

2. Run the Docker container:

```bash
docker compose up --build
```