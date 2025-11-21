FROM public.ecr.aws/nginx/nginx:alpine    # ← THIS LINE IS THE CURE

LABEL app="TEST"
COPY index.html /usr/share/nginx/html/index.html

# Fix /app1 to /app7 + React Router forever
RUN echo 'server { \
    listen 80; \
    root /usr/share/nginx/html; \
    location ~ ^/app[1-7](/|$) { try_files /index.html =404; } \
    location / { try_files $uri $uri/ /index.html; } \
}' > /etc/nginx/conf.d/default.conf

EXPOSE 80
