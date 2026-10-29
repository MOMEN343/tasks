
CREATE TABLE public.profiles (
    id uuid NOT NULL,
    name text,
    CONSTRAINT profiles_pkey PRIMARY KEY (id),
    CONSTRAINT profiles_id_fkey
        FOREIGN KEY (id) REFERENCES auth.users(id)
);

CREATE TABLE public.events (
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    user_id uuid NOT NULL,
    title text NOT NULL,
    image_url text,
    address text NOT NULL,
    event_date date NOT NULL,
    event_time time without time zone NOT NULL,
    attendance_count integer NOT NULL DEFAULT 0,
    budget numeric NOT NULL DEFAULT 0,
    invited_count integer NOT NULL DEFAULT 0,
    gifts_count integer NOT NULL DEFAULT 0,
    total_gift_amount numeric NOT NULL DEFAULT 0,
    average_gift_value numeric NOT NULL DEFAULT 0,
    created_at timestamp with time zone NOT NULL DEFAULT now(),
    CONSTRAINT events_pkey PRIMARY KEY (id),
    CONSTRAINT events_user_id_fkey
        FOREIGN KEY (user_id) REFERENCES auth.users(id)
);


ALTER TABLE public.events ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view their own events"
ON public.events
FOR SELECT
TO authenticated
USING (auth.uid() = user_id);

CREATE POLICY "Users can create their own events"
ON public.events
FOR INSERT
TO authenticated
WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their own events"
ON public.events
FOR UPDATE
TO authenticated
USING (auth.uid() = user_id)
WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can delete their own events"
ON public.events
FOR DELETE
TO authenticated
USING (auth.uid() = user_id);

CREATE POLICY "Users can read own profile"
ON public.profiles
FOR SELECT
TO authenticated
USING (auth.uid() = id);

CREATE POLICY "Users can insert their own profile"
ON public.profiles
FOR INSERT
TO authenticated
WITH CHECK (auth.uid() = id);


INSERT INTO storage.buckets (
    id,
    name,
    public,
    allowed_mime_types
)
VALUES (
    'event-images',
    'event-images',
    true,
    ARRAY['image/jpeg', 'image/png', 'image/webp']
)
ON CONFLICT (id) DO UPDATE SET
    public = EXCLUDED.public,
    allowed_mime_types = EXCLUDED.allowed_mime_types;

CREATE POLICY "User can upload images"
ON storage.objects
FOR INSERT
TO authenticated
WITH CHECK (
    bucket_id = 'event-images'
    AND (storage.foldername(name))[1] = (SELECT auth.uid())::text
);

CREATE POLICY "User can read own images"
ON storage.objects
FOR SELECT
TO authenticated
USING (
    bucket_id = 'event-images'
    AND (storage.foldername(name))[1] = (SELECT auth.uid())::text
);

CREATE POLICY "User can delete own images"
ON storage.objects
FOR DELETE
TO authenticated
USING (
    bucket_id = 'event-images'
    AND (storage.foldername(name))[1] = (SELECT auth.uid())::text
);
