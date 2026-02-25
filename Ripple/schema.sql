create table public.profiles(
  id uuid primary key default gen_random_uuid(),
  name text
);

create table public.contacts(
  profile_id uuid,
  contact_id uuid,
primary key (profile_id, contact_id)
);

create table public.messages(
  sender_id uuid,
  recipient_id uuid,
  content text not null,
  created_at timestamptz default now(),
  message_id serial primary key
);
